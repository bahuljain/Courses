type exp = 
  | Int of int
  | Add of exp*exp
  | Mul of exp*exp
;;

let my_example = Add (Mul (Int 2,Int 2), Mul (Int 3,Int 3));;

let rec eval (e : exp) : int = 
  match e with
    | Int x -> x
    | Add (x,y) -> (eval x) + (eval y)
    | Mul (x,y) -> (eval x) * (eval y)
;;

(* 
   a * b + c * d -> a * (b + c)
   the answer below factorizes expressions at a deeper level which is actually not required but its complete
*)

let rec factorize (e : exp) : exp = 
  match e with
  | Int x -> Int x
  | Mul (x,y) -> Mul (factorize x, factorize y)
  | Add (x,y) -> 
    match (x,y) with
      | (Mul (a,b), Mul (c,d)) -> 
        if a = c then Mul (factorize a, Add (factorize b, factorize d)) 
        else Add (factorize x,factorize y)
      | _ -> Add (factorize x, factorize y)
;;

let expand (e : exp) : exp =
  match e with 
    | Mul (x , Add (y, z)) -> Add (Mul (x, y), Mul (x, z))
    | _ -> e
;;

let rec simplify (e : exp) : exp = 
  match e with
    | Int x -> Int x
    | Mul (x, Int 0) | Mul (Int 0, x) -> Int 0
    | Mul (x, Int 1) | Mul (Int 1, x) | Add (x, Int 0) | Add (Int 0, x) -> simplify x
    | Add (x,y) -> Add (simplify x, simplify y)
    | Mul (x,y) -> Mul (simplify x, simplify y)
;;