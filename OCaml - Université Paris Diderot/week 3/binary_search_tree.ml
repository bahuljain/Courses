type 'a bst = 
  | Empty
  | Node of 'a bst * 'a * 'a bst
;;

(* Lovely part is you can see the whole damn tree at the end of the result :) *)
let rec insert x = function
  | Empty -> Node (Empty, x, Empty)
  | Node (l, y, r) ->
    if x = y then Node (l, y, r)
    else if x < y then Node (insert x l, y, r)
    else Node (l, y, insert x r)
;;

let rec find_max = function
  | Empty -> assert false
  | Node (_, x, Empty) -> x
  | Node (_, x, r) -> find_max r
;;

let rec delete x = function 
  | Empty -> Empty
  | Node (l, y, r) ->
    if x = y then 
      match l, r with
        | Empty, r -> r
        | l, Empty -> l
        | l,r -> let m = find_max l in Node (delete m l, m, r)
    else if x < y then Node (delete x l, y, r)
    else  Node (l, y, delete x r)
;;

let balanced root : bool = 
  let rec height = function
  | Empty -> 0
  | Node (l,_,r) -> let lh = height l and rh = height r in
    if lh = -1 || rh = -1 || abs (lh - rh) > 1 then -1
    else 1 + max lh rh 
  in 
  if height root = -1 then false else true
;;
