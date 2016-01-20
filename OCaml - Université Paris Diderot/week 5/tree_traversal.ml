type 'a bt =
  | Empty
  | Node of 'a bt * 'a * 'a bt ;;

exception Unbalanced of int ;;

let tree : int bt = Node (Node (Empty, 2, Empty), 4, Node(Empty, 6, Empty));;
let unbal_tree : int bt = Node (Node (Node (Empty, 1, Empty), 2, Empty), 4, Node(Empty, 6, Empty));;


let balanced_fast (root : 'a bt) : (bool * int) =
  let rec height (leaf : int) = function
  | Empty -> (0, leaf + 1)
  | Node (l,_,r) ->
    (* lh: left height, ll: leaves visited on left, similarly for right *)
    let (lh, ll) = height leaf l and (rh, rl) = height leaf r in
    if lh <> rh then raise (Unbalanced (ll + rl))
    else (1 + max lh rh, ll + rl)
  in
  try
    let (_, leaves) = (height 0 root) in (true, leaves)
  with
    | Unbalanced leaves -> (false, leaves)
;;


assert (balanced_fast tree = (true, 4));;
assert (balanced_fast unbal_tree = (false, 3));;