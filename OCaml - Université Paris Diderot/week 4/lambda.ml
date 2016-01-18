let rec last_element = function
  | [] -> (invalid_arg "last_element")
  | x :: [] -> x
  | x :: xy -> last_element xy
;;

let rec is_sorted = function
  | [] | [_] -> true
  | x :: y :: ys ->
    if x < y then is_sorted (y :: ys) else false ;;

