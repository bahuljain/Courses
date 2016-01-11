#OCaml

###Data Types

- Basic types are disjoint. i.e no value belongs to 2 different types
- no implicit conversion


1. Integer (int)
2. Boolean (bool)
3. Float (float)
	- dot or exp while declaring
	- dot after operater for float numbers
	- float_of_int : int to float conversion
	- int_of_float : float to int conversion

4. Characters (char)
	- 256 characters
	- 'a'
	- Char.chr : int -> char
	- Char.code : char -> int

5. String (string)
	- "Hello, World!"
	- ^ -> string concat
	- String.length
	- int_of_string
	- float_of_string
	- 0 based indexing.

###Expressions

- compute values

1. if ... then ... else ...
	- if -> boolean expression
	- then and else -> same type expression
