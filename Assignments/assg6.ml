exception NotImplemented;; 

type transaction = Withdraw of int 
					| Deposit of int  
					| CheckBalance 
					| ChangePassword of string 
					| Close ;; 
					
(*Question 1*)

let makeProtectedAccount ((openingBalance: int),(password: string))= 
    let pwd = ref password  in  (*alias for password*)
    let balance = ref openingBalance in  (*alias*)
    let account_closed = ref false in  (*acount is open by default*) 
    
    fun ((checkpwd:string), (t:transaction)) -> 
        if !account_closed = true then Printf.printf "Account closed."
        else 
            match checkpwd with 
            |password -> if password <> !pwd then
                            print_string "Incorrect password" 
                        else 
                            match t with 
                            |ChangePassword(n) -> ((pwd := n); (*assign new password*)
                                                    (print_string "Password changed.")) 
                            |Withdraw(m) -> 
                                if (!balance >= m) then 
                                    ((balance := !balance - m); 
                                    (Printf.printf "The new balance is: %i." !balance))
                                else 
                                    print_string "Insufficiend funds."
                            |Deposit(m) -> 
                                ((balance := !balance + m); 
                                (Printf.printf "The new balance is: %i." !balance)) 
                            |CheckBalance -> 
                                (Printf.printf "The new balance is: %i." !balance)
                            |Close -> 
                                ((account_closed := true); 
                                (Printf.printf "Account successfully closed.")) 
                              
                                
                            
        
