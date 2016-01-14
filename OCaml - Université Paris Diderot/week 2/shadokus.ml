type date =
  { year : int; month : int; day : int;
    hour : int; minute : int }

let the_origin_of_time =
  { year = 1; month = 1; day = 1;
   hour = 0; minute = 0 }
;;
  
let wellformed (date : date) : bool =
  if (date.year >= 1 && date.month >= 1 && date.month <= 5 
        && date.day >= 1 && date.day <= 4 && date.hour >= 0 
        && date.hour <= 2 && date.minute >= 0 && date.minute <= 1)
  then true
  else false
;;

let next (date : date) : date = 
  let minute = if (date.minute = 1) then 0 else 1 and 
    flag = if (date.minute = 1) then true else false in
  let hour = if flag then (date.hour + 1) mod 3 else date.hour and
     flag = if (flag && date.hour = 2) then true else false in
  let day = 
    if flag then (if date.day = 4 then 1 else date.day + 1)
    else date.day and
      flag = if flag && date.day = 4 then true else false in
  let month = 
    if flag then (if date.month = 5 then 1 else date.month + 1)
    else date.month and
      flag = if flag && date.month = 5 then true else false in
  let year = 
    if flag then date.year + 1 else date.year in
  { year = year; 
    month = month; 
    day = day; 
    hour = hour;
    minute = minute }  
;;

let of_int minutes : date =
  let rec get_date minutes (cur_date : date) : date = 
    if minutes = 0 then cur_date
    else get_date (minutes - 1) (next cur_date) in
  get_date minutes the_origin_of_time
;;
  