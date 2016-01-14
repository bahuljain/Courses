let integer_square_root n =
  int_of_float (sqrt (float_of_int n))
;;

let multiple_of n d =
  (n mod d) == 0
;;

let rec multiple_upto n r =
  if r < 2 then false
  else if multiple_of n r then true 
  else multiple_upto n (r - 1)
;;  

let is_prime n =
  not (multiple_upto n (integer_square_root n))
;;

let rec gcd n m = 
  if m = 0 then n else gcd m (n mod m)
;;

Printf.printf "%d\n" (gcd 27 21);;