type operation =
  | Op of string * operation * operation
  | Value of int
;;

type env = (string * (int -> int -> int)) list;;

let environment = [
  ("add", fun x y -> x+y);
  ("sub", fun x y -> x - y);
  ("mul", fun x y -> x * y);
  ("div", fun x y -> x / y)
];;

let rec lookup_function n = function
  | [] -> invalid_arg "lookup_function"
  | (op, f) :: xs when n = op -> f
  | _ :: xs -> lookup_function n xs
;;

lookup_function "sub" environment;;
lookup_function "div" environment;;
lookup_function "mod" environment;;

let add_function name op env =
  let rec exists name = function
    | [] -> false
    | (n, _) :: _ when name = n -> true
    | _ :: xs -> exists name xs
  in
  if (exists name env) then assert(false)
  else (name, op) :: env
;;

add_function "add" (fun x y -> x+y) environment;;
add_function "mod" (fun x y -> x mod y) environment;;

let my_env : env = [
  ("min", fun x y -> if x < y then x else y)
];;

let rec compute (env : env) (op : operation) : int =
  match op with
  | Value x -> x
  | Op (name, x, y) -> (lookup_function name env) (compute env x) (compute env y)
;;

let op = Op ("mul", Op ("add", Value 0, Value 1), Op ("mul", Value 3, Value 4));;
let op2 = Op ("mul", Op ("mul", Value 0, Value 1), Op ("add", Value 3, Value 4));;

assert (compute environment op = 12);;
assert (compute environment op2 = 0);;

(*LOL I actually coded compute_eff part in compute!! *)

