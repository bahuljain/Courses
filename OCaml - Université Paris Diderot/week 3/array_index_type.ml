type index = Index of int;;

let read arr (k : index) = 
  match k with
    Index x -> arr.(x)
;;

let inside arr (idx : index) : bool =
  match idx with
    Index x -> x < Array.length arr && x >= 0
;; 

let next (k : index) : index = 
  match k with
    Index x -> Index (x + 1)
;;


