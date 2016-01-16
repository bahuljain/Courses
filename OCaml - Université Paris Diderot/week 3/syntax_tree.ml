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
   Also recursion is not required this could have been very simplified
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
