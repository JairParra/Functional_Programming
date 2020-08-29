(*Classic recursive factorial*)
let rec fact n = 
		if n = 0 then 1 
		else  
    n * fact(n-1);; 

(*Tail recursive factorial *)
let fastfact n = 
		let rec helper(n,m) =
    if n =0 then m 
    else helper(n-1, n*m)
		in 
		helper(n,1)  (*Call to the function*)
;; 
  
