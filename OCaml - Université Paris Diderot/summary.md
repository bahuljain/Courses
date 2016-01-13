#OCaml

###Data Types

Basic types are disjoint. i.e no value belongs to 2 different types<br>
no implicit conversion


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

compute values

1. if ... then ... else ...
	- if -> boolean expression
	- then and else -> same type expression

###Definitions

	- give names to values
	- use 'and' for simultaneous definition
	- let <var1> = <expr1> and let <var2> = <expr2>;;


#####Global 
	- effective for the rest of the top level session
	- let name = expression
	- once set, the value of an identifier never changes

#####Local
	- effective only is given scope
	- let <name> = <expression> in <local scope: expression>
	
###Functions
	- let <function name> <arguments>...<args> = {body}
	- lexical scoping
	
#####Recursive Functions
	- using keyword 'rec'
	- let rec <name> <arguments> = <expression including call to itself>
	- important to learn recursion since there are no loops in ocaml
	
###User Defined Types
	- type <identifier> = some_type
	- must start with lowercase letters
	- to annotate -> x : some_type