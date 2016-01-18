let ccr = fun a ->
  fun b ->
    fun c ->
      fun s ->
        s /. (8. *. cos (a /. 2.) *. cos (b /. 2.) *. cos (c /. 2.))
;;

let ccr2 = fun a ->
  let a' = 8. *. cos (a /. 2.) in
  fun b ->
    let ab' = a' *. cos (b /. 2.) in
    fun c ->
      let abc' = ab' *. cos (c /. 2.) in
      fun s -> s /. abc'
;;

assert (ccr 1. 2. 3. 4. = ccr2 1. 2. 3. 4.);;