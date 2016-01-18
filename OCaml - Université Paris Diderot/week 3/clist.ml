type 'a clist =
  | CSingle of 'a
  | CApp of 'a clist * 'a clist
  | CEmpty
;;
   
let example =
  CApp (CApp (CSingle 1,
              CEmpty),
        CApp (CSingle 3,
              CApp (CSingle 4, CEmpty)))
;;

let rec to_list l =
  match l with
    | CEmpty -> []
    | CSingle x -> [x]
    | CApp (x,y) -> (to_list x) @ (to_list y)
;; 

let split l =
  let m = (List.length l)/2 in 
  let rec assign i (left, right) = 
    if i >= List.length l then (left, right)
    else if i < m then 
      let (f,b) = assign (i + 1) (left,right) in
      ((List.nth l i) :: f, b)
    else  
      let (f,b) = assign (i + 1) (left,right) in
      (f, (List.nth l i) :: b)
  in
  assign 0 ([],[])
;;
      
let rec of_list l =
  match l with 
    | [] -> CEmpty
    | x :: [] -> CSingle x
    | x :: y -> 
      let (l,r) = split (x :: y) in
      CApp (of_list l, of_list r)
;;
         
let append l1 l2 =
  match l1, l2 with
    | CEmpty, l2 -> l2
    | l1, CEmpty -> l1
    | l1, l2 -> CApp (l1, l2)
;;

let rec hd l =
  match l with
    | CEmpty -> None
    | CSingle x -> Some x
    | CApp (x,y) -> hd x 
;;

let rec tl l =
  let rec tl' l = match l with
    | CSingle x -> CEmpty
    | CApp (x,y) -> CApp (tl' x, y) 
  in
  match l with
    | CEmpty -> None
    | _ -> Some (tl' l)
;;