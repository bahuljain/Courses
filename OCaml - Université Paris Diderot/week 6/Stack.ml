module Stack = struct
  type 'a t = 'a list
  let empty = []
  let push x xs = x :: xs
  let pop = function
    | [] -> None
    | x :: xs -> Some (x, xs)
end;;

let stack = Stack.empty;;

let stack = Stack.push 1 stack;;

let x, s = match (Stack.pop stack) with
  | None -> assert false
  | Some (x, s) -> (x, s)
;;

Stack.pop s;;