type point  = { x : float; y : float; z : float }
type dpoint = { dx : float; dy : float; dz : float }
type physical_object = { position : point; velocity : dpoint }
  
let move p dp : point = 
  { x = p.x +. dp.dx ; y = p.y +. dp.dy ; z = p.z +. dp.dz }
;;

let next (obj : physical_object) : physical_object = 
  {  position = move obj.position obj.velocity ; 
   	 velocity = obj.velocity 
  }
;;

let dist (p1 : point) (p2 : point) : float =
  sqrt (((p1.x -. p2.x) ** 2.) +. ((p1.y -. p2.y) ** 2.) +. ((p1.z -. p2.z) ** 2.))
;;

let will_collide p1 p2 : bool = 
  let next_p1 = next p1 and next_p2 = next p2 in
  if dist next_p1.position next_p2.position <= 2. then true
  else false
;;

