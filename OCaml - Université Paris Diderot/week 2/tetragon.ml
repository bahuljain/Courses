type point2d = int * int;;

(* the left upper point (lup), 
   the right upper point (rup), 
   the left lower point (llp) and 
   the right lower point (rlp) 
*)
type tetragon = point2d * point2d * point2d * point2d;;

let pairwise_distinct (figure : tetragon) : bool =
  let (lup, rup, llp, rlp) = figure in
  if lup = rup || lup = llp || lup = rlp || rup = llp || rup = rlp || llp = rlp then false
  else true
;;

let wellformed (lup, rup, llp, rlp) : bool =
  let (lup_abs, lup_ord) = lup and (llp_abs, llp_ord) = llp in
  if lup_ord <= llp_ord then false
  else 
    let (rup_abs, rup_ord) = rup and (rlp_abs, rlp_ord) = rlp in
    if rup_ord <= rlp_ord then false
    else 
      if lup_abs > rup_abs || lup_abs > rlp_abs || llp_abs > rup_abs || llp_abs > rlp_abs  then false
      else true
;;

let rotate_point (point : point2d) : point2d = 
  let (abs, ord) = point in
  (ord, (-1 * abs))
;;

let reorder (a,b,c,d) : tetragon =
  if wellformed (a,b,c,d) then (a,b,c,d)
  else if wellformed (a,b,d,c) then (a,b,d,c)
  else if wellformed (a,d,b,c) then (a,d,b,c)
  else if wellformed (d,a,b,c) then (d,a,b,c)
  else if wellformed (a,c,b,d) then (a,c,b,d)
  else if wellformed (a,c,d,b) then (a,c,d,b)
  else if wellformed (a,d,c,b) then (a,d,c,b)
  else if wellformed (d,a,c,b) then (d,a,c,b)
  else if wellformed (c,a,b,d) then (c,a,b,d)
  else if wellformed (c,a,d,b) then (c,a,d,b)
  else if wellformed (c,d,a,b) then (c,d,a,b)
  else if wellformed (d,c,a,b) then (d,c,a,b)
  else if wellformed (b,a,c,d) then (b,a,c,d)
  else if wellformed (b,a,d,c) then (b,a,d,c)
  else if wellformed (b,d,a,c) then (b,d,a,c)  
  else if wellformed (d,b,a,c) then (d,b,a,c)
  else if wellformed (b,c,a,d) then (b,c,a,d)
  else if wellformed (b,c,d,a) then (b,c,d,a)
  else if wellformed (b,d,c,a) then (b,d,c,a)
  else if wellformed (d,b,c,a) then (d,b,c,a)
  else if wellformed (c,b,a,d) then (c,b,a,d)  
  else if wellformed (c,b,d,a) then (c,b,d,a)
  else if wellformed (c,d,b,a) then (c,d,b,a)
  else (d,c,b,a)
;;

let rotate_tetragon (lup, rup, llp, rlp) : tetragon = 
  let a = rotate_point lup and
  	b = rotate_point rup and 
    c = rotate_point llp and
    d = rotate_point rlp in
      
  reorder (a,b,c,d)
;;