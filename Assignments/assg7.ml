exception NotImplemented;;

type typExp =
  | TypInt
  | TypVar of char
  | Arrow of typExp * typExp
  | Lst of typExp;;

type substitution = (char * typExp) list;;

let te1 = Arrow(TypInt, Arrow(TypVar 'c', TypVar 'a')) ;;
let te3 = Arrow(TypVar 'a',Arrow (TypVar 'b',TypVar 'c')) ;;

(* Question 1.1 *)
let rec occurCheck (v: char) (tau: typExp) : bool =
  (*we need to check if a type variable occurs in an expression*) 
  match tau with 
  |TypInt -> false (*does not occur if it's int?*) 
  |TypVar a -> (*if a is a TypVar, check whether is the same*)
      if v=a then true else  false
  |Arrow (tau1,tau2) -> 
      if occurCheck v tau1 = false then 
        (if occurCheck v tau2 then true else false )
      else true
  |Lst tlist -> (*check whether it is of type list*)
      if occurCheck v tlist then true else false
;;

(* Question 1.2 *)
let rec substitute (tau1 : typExp) (v : char) (tau2 : typExp) : typExp = 
  match tau2 with 
  | TypInt -> TypInt (*[tau/a]int = int*)
  |TypVar a ->  (*[tau/a]a = tau*)
      if v=a then 
        tau1 
      else 
        TypVar a 
  |Arrow(t1, t2) -> (*[tau/a]t1->t2 = ([tau/a]t1) -> ([tau/a]t2)*) 
      Arrow(substitute tau1 v t1, substitute tau1 v t2) 
  |Lst t -> 
      Lst(substitute tau1 v t)
;;

(* Question 1.3 *)
let applySubst (sigma: substitution) (tau: typExp) : typExp = 
  (*substitutes char v in expression typExp with tau?*)
  let subs (v,exp) = 
    fun tau -> substitute exp v tau (* [tau1/a]tau2*)
  in
  (*f [x1,..xn] b = (f...(f(f xn b) x_{n-1})... x1) ; b is an acc.*)
  List.fold_right subs sigma tau 
;;

(* Question 2 *)
let rec unify (tau1: typExp) (tau2:typExp) : substitution = 
  match tau1, tau2 with
  |TypInt, TypInt -> []
  |TypVar x1, b -> 
      if (TypVar x1 = b) then [] 
      else if occurCheck x1 b then failwith "Error"
      else[(x1,b)]
  |b, TypVar x2 -> 
      if( TypVar x2 = b) then[]
      else if occurCheck x2 b then failwith "Error"
      else [(x2,b)] 
  |Arrow (ta1, tb1), Arrow (ta2, tb2) ->
      let b = (unify ta1 ta2) in 
      let a1 = applySubst b tb1 in
      let a2 = applySubst b tb2 in
      (unify a1 a2) @ b 
  |(Lst t1),(Lst t2) -> unify t1 t2
  |_ -> failwith "Error"
;;



