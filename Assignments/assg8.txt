exception NotImplemented

(* The type of parsed expression trees *)
type exptree =
  | Var of char
  | Expr of char * exptree * exptree

(* A list of valid variable names *)
let charSet =
  let rec aux i acc =
    if i < 97 then acc else aux (i-1) ((Char.chr i) :: acc)
  in
  aux 122 []

(* Returns true if x is an element of lst, false otherwise *)
let isin (x: char) lst =
  List.exists (fun y -> x = y) lst
  
 
(* Question 1: Parsing *)
let parse (inputexp: string): exptree =
  (*Input is a string which is an expression tree*)
  let sym = ref inputexp.[0] in (*obtain the first character of the exptree*)
  let cursor = ref 0 in (*pointer by def to position 0*)

  (*This part obtains symbol from string, the () stands for a dummy unit value!*)
  let getsym () =
    cursor := !cursor + 1; (*update cursor ptr value, increase by 1*)
    sym := inputexp.[!cursor] (*sym gets the value of the string at cursor*)
  in

  (* The following three definitions are circulary recursive:  *)
  (* <EXP> -> <TERM> { + <TERM>}  *) 
  let rec expr (): exptree =
    let lf= term() in  (* *)
    if !sym <> '+' then lf (*is symbol is not addition, return <TERM>*)
    else 
      begin (*imperative part*)
        getsym();  (*obtain the symbol*)
        Expr('+',lf, expr()) (*return  <TERM> + <TERM>*)
      end 
  (*<TERM> -> <P> {*<P>} *)
  and term (): exptree = 
    let lf = primary() in  
    if !sym <> '*' then lf (*if symbol is not * , return <P> *) 
    else 
      begin 
        getsym(); (*obtain symbol*)
        Expr('*',lf, term()) (*return <P> * <P> *)
      end
 (*<P> -> A|B|C|...|Z|<EXP>*)
  and primary (): exptree = (*only symbol with parentheses*)
    (*check for parenthese match*)
    if !sym = '(' 
    then 
      begin
        getsym (); (*obtain symbol*)
        let result = expr () in (*fetch result form expression*)
        if !sym <> ')' then
          failwith "Mismatched parens"
(*else if the last line is what we' re trying to read*)
        else if !cursor = (String.length inputexp) - 1  then
          result (*just return whatever the symbol is *)
        else 
          begin
            getsym (); (*obtain symbol*)
            result (*return some symbol A,..,Z*)
          end
      end
(*if there were not parentheses*)
    else
    if isin !sym charSet then (*if symbol is not in the character set*)
      if !cursor = (String.length inputexp) - 1 then
        Var !sym
      else
        let result = Var !sym in
        begin
          getsym (); (*obtain symbol *)
          result
        end
    else
      failwith "In primary"
  in
  expr () (*return (<EXP>) or whatever this is lol  *)


(* Question 2: Code Generation *)
let tempstore = ref 0 (*temporary variable*)

let codegen (e: exptree) =
  let rec helper ((e: exptree), (tag: char)) =
    match e with
    | Var c -> 
        begin 
          if (tag = '=') then 
            Printf.printf "LOAD %c\n" c 
          else if (tag = '*') then  
            Printf.printf "MUL %c\n" c 
          else
            Printf.printf "ADD %c\n" c
        end
    | Expr(op, l, r) ->
        if (tag = '=') then
          begin
            helper(l,'='); 
            helper(r,op)
          end
        else 
          begin
            tempstore := !tempstore + 1;
          (* Your code for dealing with STORE goes here *)
            Printf.printf "STORE %i\n" !tempstore; (*display stored cell?*)
            helper(l,'='); 
            helper(r,op); 
            (if (tag = '+') then
               Printf.printf "ADD %i\n" !tempstore
             else
               Printf.printf "MUL %i\n" !tempstore);
            tempstore := !tempstore - 1
          end
  in
  helper (e, '=')
