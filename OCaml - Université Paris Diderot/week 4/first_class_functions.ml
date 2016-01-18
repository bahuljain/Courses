let rec compose l = (function x ->
  match l with
  | [] -> x
  | f :: fs -> f (compose fs x));;

compose [(fun x -> x+1);(fun x -> 3*x);(fun x -> x-1)] 2 = 4;;

let rec fixedpoint f start delta =
  let nxt = (f start) in
  if abs_float (nxt -. start) < delta then start
  else fixedpoint f nxt delta
;;

fixedpoint cos 0. 0.001;;

