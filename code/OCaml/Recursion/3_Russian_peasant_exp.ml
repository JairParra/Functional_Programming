(*Prelude*)
let even n = (n mod 2) = 0;; 
let odd n = (n mod 2) = 1;;	

(*Fast exponentiation using the Russian Peasant algorithm*)
let rec rpe base power = 
		if base = 0 then 0
		else
  if power = 0 then 1 
  else 
  if (odd power) then 
    base * (rpe base (power - 1)) 
  else 
    let tmp = (rpe base (power/2)) in 
    tmp * tmp
;; 

(*Tail-recursive version*)
let fast_exp (base, power) = 
		let rec fast_exp_aux (base, power, acc) = 
    if base = 0 then 0 
    else 
				if power = 0 then acc  
				else 
    if  (odd power) then 
						fast_exp_aux (base*base,((power-1)/2),(acc * base)) 
    else 
						fast_exp_aux ((base*base), (power/2), acc) 
		in 
		fast_exp_aux(base,power,1)
;; 

(*A more intuitive tail-recursive version*)
		let rec fast_exp_aux (base, power, acc) = 
			if base = 0 then 0 
			else 
				if power = 0 then acc (*return accumulator parameter*) 
				else 
					if (odd power) then 
						fast_exp_aux (base, power-1, acc * base) (* x*x^{n-1} *)
					else 
						fast_exp_aux (base, power/2, acc*acc)
		in 
		fast_exp_aux(base,power,1)
;;
