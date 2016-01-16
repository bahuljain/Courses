let rec mem x l : bool = 
  match l with
    | [] -> false
    | y :: ly -> 
      if x = y then true else mem x ly
;; 

let rec append l1 l2 : int list = 
  match l1 with
    | [] -> l2
    | x :: l1x -> x :: append l1x l2 
;;

(* Not exhaustive but sufficient for the given problem *)
let rec combine l1 l2 : (int * int) list = 
  match (l1,l2) with 
    | ([], []) -> []
    | (x :: l1x, y :: l2y) -> (x,y) :: combine l1x l2y
;;

let combine2 l1 l2 : (int * int) list = 
  let f x y = (x,y) in
  List.map2 f l1 l2
;; 

let rec assoc (l : (string * int) list ) (k : string) : int option = 
  match l with
    | [] -> None
    | (k',v) :: l' -> 
      if k' = k then Some v
      else assoc l' k
;;