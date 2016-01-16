let min_arr a = Array.fold_left min max_int a;;

let min_index a =
  let min_ref i j =
    if i < 0 then j
    else if a.(i) < a.(j) then i else j in
  
  let rec min i j = 
    if j > (Array.length a) - 1 then i  
    else min (min_ref i j) (j+1) in
  
  min (-1) 0
;; 

(* returns {min_index, min} *)
type arr_element = { index : int ; value : int};;

let min_arr_2 a =
  (* converts to an array the contains tuples representing (index, value) *) 
  let a_map = Array.mapi (fun i x -> {index = i; value = x}) a and 
    min_record x y = if x.value < y.value then x else y in
  
  Array.fold_left min_record {index = (-1); value = max_int} a_map
;;      
      