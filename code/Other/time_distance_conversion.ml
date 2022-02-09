
(*Declare custom types*) 
type dist_unit = Foot | Meter | Mile ;; 
type time_unit = Second | Hour;; 
type speed_unit = dist_unit * time_unit ;; 
type 'a value  = 'a * float;; 

(*Construct time convertion function *) 
let convert_time 
    ((from_unit, val_) : time_unit value) 
    to_unit: time_unit
    value = 
  (*Unpack the from_unit, val_*) 
  match (from_unit, val_) with 
  |fu, v -> 
      (*Pack from unit in one variable*) 
      let from_to = (fu, to_unit) in 
      match from_to with 
      |(Second, Hour) -> Hour, val_ /. 3600. 
      |(Hour, Second) -> Second, val_ *. 3600.
      |(_, _) ->  to_unit, val_
;;

(*Test cases*) 
convert_time (Hour, 1.) Second;;  (*3600*) 
convert_time (Hour, 1.) Hour;;  (*1*) 
convert_time (Second, 3600.) Hour;;  (*3600*) 
convert_time (Second, 115200.) Hour;;  (*32*) 
                                              
(*Construct time convertion function *) 
let convert_dist 
    ((from_unit, val_) : dist_unit value) 
    to_unit: dist_unit
    value = 
  (*Unpack the dist_unit, val_*) 
  match (from_unit, val_) with 
  |du, v -> 
      (*Pack from unit in one variable*) 
      let from_to = (du, to_unit) in 
      match from_to with 
      |(Mile, Foot) -> Foot, val_ *. 5280. 
      |(Foot, Mile) -> Mile, val_ /. 5280. 
      |(Foot, Meter) -> Meter, val_  *. 0.3048 
      |(Meter, Foot) -> Foot, val_  /. 0.3048
      |(Mile, Meter) -> Meter, (val_ *. 5280. ) *. 0.3048
      |(Meter, Mile) -> Mile, (val_ /. 0.3048 ) /. 5280. 
      |(_, _) -> to_unit, val_
;;   


(*Convert speed function*) 
(*Construct time convertion function *) 
let convert_speed
    ((from_unit, val_) : speed_unit value) 
    to_unit: speed_unit
    value = 
  (*Unpack the dist_unit, val_*) 
  match (from_unit, val_) with 
  |fu, v -> 
      match fu with 
      |(from_dist, from_time) -> 
          match to_unit with 
          |(to_dist, to_time) -> 
              (* Convert numerator and denominator *)
              let dist_val = convert_dist (from_dist, val_) to_dist in 
              let time_val = convert_time (from_time, 1.) to_time in 
              let speed_tup = (dist_val, time_val) in 
              match speed_tup with 
              |((d_unit, x),(t_unit, y)) -> (x /. y, (d_unit, t_unit)) 
;;  


