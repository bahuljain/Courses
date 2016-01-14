let multiple_of n d =
  (n mod d) == 0;;

let integer_square_root n =
  int_of_float (sqrt (float_of_int n));;
  
let last_character str =
  (String.get str ((String.length str) - 1)) ;;

let string_of_bool truth =
  (string_of_bool truth);;

let rec fact n = if n <= 1 then 1 else n * fact(n-1);; 