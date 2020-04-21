let remove (item, lst) =
  List.filter (fun u -> not (u = item)) lst

(* Question 1. *)

let common_tests = [ 
  ( ([],[]), []); 
  ( ([1;2;3],[]), []); 
  ( ([3;4;4],[2;3;4]), [3; 4]); 
]

let rec common twolists = 
  match twolists with 
  |([],[]) -> [] 
  |([],_) -> []
  |(_,[]) -> []
  |(x::l1,l2) ->
      if (List.mem x l2) then x :: common (l1, remove(x,l2))
      else  common(l1,l2)
;;

(* List.filter (fun x -> List.mem x l1) l2 *)

(* Question 2. Mergesort requires that you use recursion.  Using List.sort or
some other sort defeats the whole purpose.  This question is for the
implementation of split.*)

let split_tests = [ 
  ([1; 3; 2; 4; 5; 6; 9; 11; 17; 13; 12], ([1; 2; 5; 9; 17; 12], [3; 4; 6; 11; 13]));
  ([], ([],[])) ; 
  ([3],([3],[])) ; 
  ([3;4;5],([3;5],[4]));
  ([3;4;5;4],([3;5],[4;4])); 
]

let rec split l =  
  match l with 
  |[] -> [],[] 
  |x::[] -> [x],[] 
  |x::y::rest -> 
      let l1,l2 = split rest in 
      x::l1, y::l2
;;

(* Question 3 Here you implement merge. *)

let merge_tests = [ 
  (([],[]),[]); 
  (([1;2;3],[]),[1;2;3]); 
  (([],[4;5;6]),[4;5;6]);
  (([1;3;5],[2;4;6]),[1;2;3;4;5;6]); 
]

let rec merge twolists =
  match twolists with  
  |([],[]) -> [] 
  |([],l2) -> l2
  |(l1,[]) -> l1 
  |(l1,l2) -> 
      match l1,l2 with 
      |[], _ -> l2 
      | _,[] -> l1 
      |x :: xs, y :: ys -> 
          if x < y then x :: merge (xs,l2) 
          else 
            y :: merge (l1,ys) 
;;



(* Question 4 Finally you combine split and merge and use them to implement mergesort. *)

let mergesort_tests = [ 
  ([],[]); 
  ([1;5;3],[1;3;5]); 
  ([5;4;3],[3;4;5]); 
  ([-1;-10;23],[-10;-1;23]); 
  ([-3;-2;-9],[-9;-3;-2]); 
  ([1;1;1],[1;1;1]); 
  ([0],[0])
]

let rec mergesort l = 
  let splitted = split l in 
  match splitted with
  |([],[]) -> [] 
  |([],l2) -> l2
  |(l1,[]) -> l1 
  |(l1,l2) -> merge(mergesort(l1), mergesort(l2))
;;


