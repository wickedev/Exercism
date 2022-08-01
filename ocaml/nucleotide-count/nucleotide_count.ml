open Base

let empty = Map.empty(module Char)

let is_invalid c = (not (String.contains "ACGT" c))

let count_nucleotide s c = 
  if is_invalid c
    then Result.Error c
  else match (String.find s ~f:is_invalid) with
    | None -> Result.Ok (String.count s ~f:(Char.equal c))
    | Some x -> Result.Error x

let increase_count m c =
  Map.update m c ~f:(function
  | Some count -> count + 1
  | None -> 1)

let count_nucleotides s = 
  let invalid = (String.to_list s)
    |> List.filter ~f:is_invalid
    |> List.hd
  in match invalid with
    | Some x  -> Result.Error x
    | None -> Result.Ok(
      (String.to_list s)
      |> (List.fold_left
          ~f:(fun m c -> increase_count m c)
          ~init:empty))
