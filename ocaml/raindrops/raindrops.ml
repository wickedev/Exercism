
let raindrop n =
    let div by = n mod by = 0 in
    let printer message by  = if div by then message else "" in
    let output = (printer "Pling" 3)
               ^ (printer "Plang" 5)
               ^ (printer "Plong" 7) in
    if output = "" then string_of_int n else output



