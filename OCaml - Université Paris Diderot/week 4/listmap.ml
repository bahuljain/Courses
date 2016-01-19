let wrap (l : 'a list) : 'a list list =
  List.map (fun x -> [x]) l
;;

wrap [1;2;3;4;5;6];;
wrap [2];;

type 'a tree =
    Node of 'a tree * 'a * 'a tree
  | Leaf of 'a;;

let t : int tree = Node (Node (Leaf 1, 2, Leaf 3), 4, Leaf 6);;

let rec tree_map f = function
  | Leaf x -> Leaf (f x)
  | Node (l, x, r) -> Node (tree_map f l, f x, tree_map f r)
;;