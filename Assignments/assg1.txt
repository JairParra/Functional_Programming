(* Q1 TODO: Correct these tests for the double function. *)
let double_tests = [
  (0, 0);
  (1, 2);
  (3, 6);
]

(* Q1 TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)
let rec double (n: int): int = 
  match n with 
  | 0 -> 0 
  | n -> 2 + double(n -1) 
;;


(* Q1 TODO: Write your own tests for the fact function.
         See the provided tests for double, above, for how to write test cases.
         Remember that you should NOT test cases for n < 0.
*)
let fact_tests = [
  (* Your test cases go here.
     Remember that the outputs of fact should be *floating-point* numbers.
  *)
  (0,1.0); 
  (1,1.0); 
  (2,2.0); 
  (3,6.0); 
  (4,24.0); 
  (5,120.0); 
]

(* Q1 TODO: Correct this implementation so that it compiles and returns
         the correct answers.
*)

let rec fact (n:int):float = 
  match n with 
  | 0 -> 1.0 
  | _ -> float_of_int(n) *. fact(n-1) ;;

(* Q2 TODO: Write your own tests for the mysqrt function.
         You should NOT test cases for n < 0.
*)
let mysqrt_tests = [
  (* Your test cases go here. *)
  (0.0,0.0); 
  (1.0,1.0); 
  (4.0,2.0); 
  (9.0,3.0); 
  (16.0,4.0); 
]

(* Q2 TODO: Implement mysqrt. *)
let mysqrt (x:float) =
  let rec helper((x:float), (g:float)) = (*g for a wild guess*)
    if close(square(g),x) then g 
    else helper(x, (( g +. (x /. g) ) /. 2.0) ) (*Implement the formula*)
  in
  helper(x,1.0) (*call the helper function with guess*)
;;

(* Q3 TODO: Write your own tests for the cube_root function.
            You should NOT test cases for n < 0.
*)
let cube_root_tests = [
  (* Your test cases go here. *)
  (0.0,0.0); 
  (1.0,1.0);
  (8.0,2.0); 
  (27.0,3.0);
  (64.0,4.0); 
]

(* Q3 TODO: Implement cube_root. *)
let cube_root (x:float) = 
  let rec helper((x:float), (g:float)) = (*g for a wild guess*)
    if close(cube(g),x) then g 
    else helper(x, (( 2.0 *. g +. (x /. square(g)) ) /. 3.0) ) (*Implement the formula*)
  in
  helper(x,1.0) (*call the helper function with guess*)
;;

(* Q4 TODO: Write your own tests for the fast_exp function.
            You should NOT test cases for negative bases or powers.
*)
let fast_exp_tests = [
  (* Your test cases go here. *)
  ((0,0),0); 
  ((0,2),0); 
  ((2,0),1); 
  ((2,1),2);
  ((2,3),8);
]

(* Q4 TODO: Implement tail recursive helper fast_exp_aux. *)
let rec fast_exp_aux (base, power, acc) = 
  if base = 0 then 0 
  else 
  if power = 0 then acc
  else
  if (odd power) then 
    fast_exp_aux ((base*base),((power-1)/2),(acc * base))
  else
    fast_exp_aux ((base*base),(power/2),acc) ;;

(* Q4 TODO: Implement fast_exp using fast_exp_aux. *)
let fast_exp (base, power) = 
  fast_exp_aux(base,power,1)
                                         

