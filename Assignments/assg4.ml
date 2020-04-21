(* Question 1 *)

let mapTree_tests =
  [
    (((fun x -> x), Node(Empty, 0, (Node(Empty, 1, Empty)))), 
     Node(Empty,0, (Node(Empty, 1, Empty)))) ; 
    (((fun x -> x+1), Node(Empty, 0, (Node(Empty, 1, Empty)))), 
     Node(Empty,1, (Node(Empty, 2, Empty)))) ; 
    (((fun x -> 0), Node(Empty, 0, (Node(Empty, 1, Empty)))), 
     Node(Empty,0, (Node(Empty, 0, Empty)))) ; 
    (((fun x -> x*x), Node((Node(Empty, 2, Empty)), 4, Empty )), 
     Node((Node(Empty, 4, Empty)), 16, Empty )); 
    (((fun x -> x*x), Empty), 
     Empty);
  ]

let rec mapTree (f,(t: 'a tree)) =
  match t with  
  |Empty -> Empty
  |Node (l,x,r) -> Node (mapTree (f,l), f x , mapTree(f,r))
;;

(* Question 2. *)

let halfint_tests =
  [ 
    (((fun x -> x+. 1.0),9.0, -6.0, 0.001),
     -0.9993896484375 )
  ]

let rec halfint (f, (posValue : float), (negValue : float), (epsilon : float)) = 
  let midpoint = ((negValue +. posValue) /. 2.0) in 
  let guess = (f midpoint) in 
  if (abs_float(guess) < epsilon) then midpoint
  else if guess > 0.0 then 
    halfint(f, midpoint, negValue, epsilon)
  else 
    halfint(f, posValue, midpoint, epsilon)
;;



(* Question 3. *)

let newton_tests =
  [ 
    ((sin , 5.0, 0.0001, 0.0001)
    ,9.42477) ;
  ]

  
let rec newton (f, (guess:float), (epsilon:float), (dx:float)) =
  let close x y = abs_float (x -. y) < epsilon in
  let improve (guess:float) = guess -.((f guess)/.(deriv (f, dx) guess)) in
  if close (f guess) 0.0 then guess
  else newton (f, improve guess, epsilon, dx) 
;;



(* Question 4. *)

let indIntegral (f, (dx:float)) =
  fun( x:float) -> integral (f, 0.0, x, dx)
;;
