let find arr word = 
  let rec f arr word i = 
    if i < Array.length arr then 
      if arr.(i) = word then Some (i)
      else f arr word (i + 1)
    else None
  in
  f arr word 0
;;

let default_int (t : int option) =
  match t with
    | Some x -> x
    | None -> 0
;;

let merge (x : int option) (y : int option) : int option = 
  if x = None && y = None then None
  else 
    let a = default_int x and b = default_int y in
    Some (a + b)
;;

let merge2 (x : int option) (y : int option) : int option =
  match (x,y) with
    | (None, None) -> None
    | (None, Some y) -> Some y
    | (Some x, None) -> Some x
    | (Some x, Some y) -> Some (x + y)
;;