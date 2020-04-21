exception NotImplemented;;

type term = Term of float * int;;

type poly = Poly of (float * int) list;;

exception EmptyList;;

(*
Notice that this is a mutually recursive definition. 
Each type mentions the other one. 
The keyword "and" is used for mutually recursive definitions.
*)

type cell = { data : int; next : rlist}
and rlist = cell option ref;;

(* This converts an rlist to an ordinary list. *)
let rec displayList (c : rlist) =
  match !c with
    | None -> []
    | Some { data = d; next = l } -> d :: (displayList l);;

let cell2rlist (c:cell):rlist = ref (Some c);;

let bigger ((x: int), (y: int)) = x > y;; 

--------------------------------------------------------------------

(* Q1 Polynomials TODO: Implement the following four functions *) 


let multiplyPolyByTerm(Term(c,e), Poly p) = 
  match p with 
  |[] -> raise EmptyList (*empty polynomial, bad*) 
  | _ -> 
      let rec aux (Term(c,e), Poly p) = 
        match (c,e) with 
        |(0.0,_) -> [(0.0,0)] (*constant 0 is zero polynomial*)
        |(c,_) ->  (*constant =1 , only change the exponents*)
            match p with 
            |[] -> []
            |(x,y) :: rest -> (x *. c,y + e) :: aux(Term(c,e), Poly rest)
      in 
      Poly( aux (Term(c,e), Poly p) )
;;


let addTermToPoly (Term(c,e), Poly p) =
  match p with 
  |[] -> raise EmptyList (*empty polynomial, bad*) 
  |[(0.0,0)] -> Poly([(c,e)])
  |_ -> 
      let rec aux (Term(c,e), Poly p) = 
        match (c,e) with 
        |(0.0,0) -> p
        |(c,e) ->  (*constant not 0 , find term and change the constant*)
            match p with 
            |[] -> [(c,e)]
            |(x,y) :: rest ->
                (*if term's exp match, update and attach the rest*) 
                if e = y then 
                  (x +. c, e) :: rest
                else if e > y then   (*prepend term*)
                  (c,e) :: (x, y) :: rest
                else 
                  (x, y) :: aux(Term(c,e), Poly rest) 
      in 
      Poly( aux (Term(c,e), Poly p) )
;;


let addPolys (Poly p1, Poly p2) =
  match (p1,p2) with 
  |(_,_) -> 
      let rec aux (p1, Poly p2) = 
        match p1 with
        |[] -> Poly p2
        |(x,y) :: rest  -> 
            aux(rest, addTermToPoly (Term(x,y), Poly(p2)))
      in
      aux(p1, Poly p2)
;;


let multPolys (Poly p1, Poly p2) = 
  let rec aux (Poly p1, Poly p2, Poly acc) = 
    match p1 with
    |[] -> acc
    |(x,y) :: rest  ->
        if x = 0.0 then 
          aux(Poly rest, Poly p2, addPolys(Poly [(0.0,0)], Poly acc))
        else 
          aux(Poly rest, Poly p2 ,
              addPolys(multiplyPolyByTerm(Term(x,y), Poly p2), Poly acc))
  in
  Poly (aux(Poly p1, Poly p2, Poly [(0.0,0)] ))
;;

(* Q2 References TODO: implement the `insert` function *)

let rec insert comp (item: int) (list: rlist) =
  match !list with 
  | None -> list := Some {data = item ; next = ref None }
  | Some {data = d } when comp (item,d) ->
      let nc = Some {data = item; next = ref (!list) } in list := nc
  | Some {next= tail} ->
      insert comp item tail
;;

let x2 = Term(1.0,2) ;;
let x1 = Term(1.0,1) ;;
let x0 = Term(1.0,0) ;;
let p0 = [x2;x1;x0] ;;

let zeropol = Poly ([(0.0,0)]) ;;  
let p1 = Poly ([(1.0,2); (1.0,1); (1.0,0)]) ;;
let p2 = Poly ([(1.0,2); (1.0,1); (1.0,0)]) ;;


addTermToPoly (Term(1.0,1), p1) ;;






