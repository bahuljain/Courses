let is_sorted arr = 
  let rec check i j =
    if j >= (Array.length arr) then true
    else if compare arr.(i) arr.(j) <> (-1) then false
    else check j (j+1) in
  check 0 1
;;

let binary_search arr word = 
  let rec search p q = 
    if p > q then -1
    else begin
      let mid = (p + q)/2 in  
      if compare arr.(mid) word = 0 then mid
      else if compare arr.(mid) word = 1 then search p (mid - 1)
      else search (mid + 1) q
    end in
  search 0 (Array.length arr - 1) 
;;