type nucleotide = A | C | G | T

let hamming_distance nucleotide_x nucleotide_y = 
  let x_len = (List.length nucleotide_x) and
      y_len = (List.length nucleotide_y) in
  if x_len = y_len then
    let reducer acc x y =
      if x = y
      then acc
      else acc + 1
    in
      Result.Ok (List.fold_left2 reducer 0 nucleotide_x nucleotide_y)
  else if x_len = 0 then Result.Error "left strand must not be empty"
  else if y_len = 0 then Result.Error "right strand must not be empty"
  else Result.Error "left and right strands must be of equal length"
