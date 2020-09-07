(*Classic fibonacci, by definition*)
let rec fib n = 
  if n=0 then 0 
  else if n=1 then 1 
  else 
    fib(n-1)+fib(n-1)
;;
  
(*Tail-recursive version*)
let rec tailfib n = 
	let rec helper(n,a,b) = (*Subfunction with extra parameters a and b*)
		if n=0 then a  (*Base case 1*)
		else if n=1 then b  (*Base case 2 *)
		else 
			(*Tail recursive call: decrease n , cumulate result in third argument*)
			helper(n-1, b, a+b) 
	in 
	helper(n,0,1) (*Repeat procedure n times *) 
