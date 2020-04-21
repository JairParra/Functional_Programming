(* Q1a TODO: Write your own tests for the pairlists function.
         You should NOT test lists of different lengths.
*)
let pairlists_tests = [
  (* Your test cases go here. *)
  (([], []), []); 
  (([1;2;3],[1;2;3]), [(1, 1); (2, 2); (3, 3)]);
  (([1;2;3],[4;5;6]), [(1, 4); (2, 5); (3, 6)]); 
]

(* Q1a TODO: Implement pairlists. *)
let rec pairlists twolists =
  match twolists with 
  |([],[]) -> [] 
  |(a1::l1, a2::l2) -> (a1,a2) :: pairlists (l1,l2) 
  |(_,_) -> []
;;

(* Q1b TODO: Write your own tests for the w_mean function.
         You should NOT test lists of different lengths.
*)
let w_mean_tests = [
  (* Your test cases go here. *)
  (([1.0; 1.5; 2.5; 0.5; 1.5],[10.3; 11.7; 2.0; 5.0; 6.5] ),6.44285714285714217);
  (([1.0; 2.0; 3.0],[1.0; 1.0; 1.0]),1.0); 
  (([1.0; 1.0; 1.0],[0.0; 0.0; 0.0]),0.0); 
  (([1.0; 1.0; 1.0],[-1.0; -1.0; -1.0]),-1.0); 
]

(* Q1b TODO: Implement w_mean. *)
let w_mean weights data =
  let map_dot l = List.map (fun (a1,a2) -> a1 *. a2) l in 
  sumlist (map_dot (pairlists (weights, data))) /. sumlist(weights)
;;

(* Q2 TODO: Write your own tests for the memberof function. *)
let memberof_tests = [
  (* Your test cases go here. *)
  ((2,[]), false) ; 
  ((3,[2;2;2]), false); 
  ((3,[4;5;6;2;3]), true); 
]

(* Q2 TODO: Implement memberof. *)
let rec memberof pair =
  match pair with
  |(_,[]) -> false 
  |(x,a::ls) -> 
      if (x=a) then (x=a) 
      else memberof (x,ls)
;;

(* Q2 TODO: Write your own tests for the remove function. *)
let remove_tests = [
  (* Your test cases go here. *)
  ((8,[]), []); 
  ((8,[3;8;3]), [3;3]); 
  ((8,[1;2;3]), [1;2;3]); 
  ((0,[1;2;0;0;3;4]), [1;2;3;4]); 
]

(* Q2 TODO: Implement remove. *)
let rec remove (item, lst) =
  let rec aux (item, lst, acc) = 
    match lst with 
    |[] -> acc
    |x::ls -> 
        if (x=item) then  (*If item is to be removed, ignore*)
          aux (item, ls, acc) 
        else 
          aux (item, ls, acc @ [x]) 
  in
  aux (item, lst, [])
;;

(* Q3 TODO: Write your own tests for the find_max function. *)
let find_max_tests = [ 
  ([1],1); 
  ([1;2;3],3); 
  ([-4;-5;-1],-1); 
  ([1;5;5;0],5); 
  ([0;0;0],0); 
]

(* Q3 TODO: Implement find_max. *)

let find_max l = 
  match l with 
  |[] -> failwith "None"
  |h::t ->  let rec helper (seen,rest) =
              match rest with 
                [] -> seen
              |h'::t' -> let seen' = if h' > seen then h' else seen in 
                  let rest' = t'
                  in helper (seen',rest')
      in helper (h,t) 
;;

let find_max l =
  let rec aux (l,max) = 
    match l with 
    |[] -> max
    |x::ls -> 
        if (x > max) then  
          aux (ls, x)    (*recurse with new max*)
        else 
          aux (ls, max)   (*preserve previous max*)
  in
  match l with
  |[] -> failwith "None" 
  |x::xs -> aux (xs,x)
;;

(* Q4 TODO: Write your own tests for the selsort function. *)
let selsort_tests = [
  (* Your test cases go here. *) 
  ([1;4;2;9],[9;4;2;1]) ; 
  ([-9;-1;4],[4;-1;-9]) ; 
  ([],[])
]

(* Q4 TODO: Implement selsort. *)
let rec selsort l = 
  let rec aux (l, sorted) = 
    match l with 
    |[] -> sorted 
    |_ -> let max = find_max(l) in 
        aux (remove (max, l), sorted @ [max])
  in 
  aux (l, [])
;;






