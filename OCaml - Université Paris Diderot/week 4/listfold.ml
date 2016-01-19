let rec filter (p : 'a -> bool) (l : 'a list) : 'a list =
  match l with
  | [] -> []
  | x :: xs -> if (p x) then x :: filter p xs else filter p xs
;;

filter (fun x -> x>3) [1;2;3;4];;

let partition (p : 'a -> bool) (l : 'a list) : 'a list * 'a list =
  let assign x (lpos, lneg) =
    if p x then (x :: lpos, lneg)
    else (lpos, x :: lneg)
  in
  List.fold_right assign l ([],[])
;;

partition (fun x -> x < 3) [3;6;2;7;1;0];;

let rec quicksort = function
  | [] -> []
  | x :: xs -> let (left, right) = List.partition (fun y -> y < x) xs in
  (quicksort left @ (x :: (quicksort right)))
;;

quicksort [3;4;1;8;5;7;3;0];;

let for_all l p =
  List.fold_left (fun prev x -> (p x) && prev) true l
;;

assert (for_all [1;3;6;3] (fun x -> x > 0) = true);;
assert (for_all [1;3;6;3;-2] (fun x -> x > 0) = false);;

let exists l p =
  List.fold_left (fun prev x -> (p x) || prev) false l
;;

assert (exists [1;3;6;3] (fun x -> x > 0) = true);;
assert (exists [1;3;6;3;-2] (fun x -> x > 0) = true);;

let sorted  (cmp : 'a -> 'a -> int) (l : 'a list) : bool =
  let check = List.fold_left
    (fun x y -> match x with
      | None -> None
      | Some x' -> if (cmp x' y) < 1 then Some y else None)
    (Some (List.hd l))
    l
  in
  match check with | None -> false | _ -> true
;;

assert (sorted compare [1;2;3;4;5]);;
assert (not (sorted compare [1;2;3;7;5]));;
assert (sorted compare [1;2;]);;



