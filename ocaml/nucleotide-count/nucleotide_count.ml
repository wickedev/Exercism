open Base

let empty = Map.empty(module Char)


let count_nucleotide ~s ~c = 
  if not (String.contains "ACGT" c)
    then Result.Error c
  else match (String.find s ~f:(fun c -> not (String.contains "ACGT" c))) with
    | None -> Result.Ok (String.count s ~f:(Char.equal c))
    | Some x -> Result.Error x


let count_nucleotides s = Result.Ok empty
