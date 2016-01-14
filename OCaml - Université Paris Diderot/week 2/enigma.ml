let exchange x =
  ((x mod 10) * 10) + (x / 10)
;;

let is_valid_answer (grand_father_age, grand_son_age) =
  if (grand_father_age = 4 * grand_son_age) && ((exchange grand_father_age) * 3 = (exchange grand_son_age)) then true
  else false
;;

let rec find (max_grand_father_age, min_grand_son_age) : (int * int) =
  let rec find_inner (max_age, min_age) : (int * int) =  
    if min_age > max_age then (-1, -1)
    else if is_valid_answer (max_age, min_age) then (max_age, min_age)
    else find_inner (max_age, min_age + 1) in
  if min_grand_son_age > max_grand_father_age then (-1, -1)
  else 
    let (a,b) = find_inner (max_grand_father_age, min_grand_son_age) in
    if (a,b) = (-1,-1) then find (max_grand_father_age - 1, min_grand_son_age) 
    else (a,b)
;; 
