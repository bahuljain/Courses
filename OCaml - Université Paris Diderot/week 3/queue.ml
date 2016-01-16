type queue = int list * int list;;

let is_empty (front, back) : bool =
  match (front, back) with
    | ([], []) -> true
    | (_,_) -> false
    (* Funny Looking Pattern ;) *)
;; 

let enqueue x (front, back) : queue = ( front, x :: back );;

let split (l : int list) : queue =
  let len = (List.length l) / 2 in
  let rec assign l i (front, back) : queue =
    if i >= (List.length l) then (front, back)
    else if i < len then assign l (i + 1) (front , (back @ [(List.nth l i)]))
    else  assign l (i + 1) ( (List.nth l i) :: front , back )
  in
  assign l 0 ([],[])
;;

let rec dequeue (front, back) : (int * queue) = 
  match (front, back) with
    | ((x :: front'), back) -> (x, (front',back))
    | ([], back) -> dequeue (split back)
;; 
