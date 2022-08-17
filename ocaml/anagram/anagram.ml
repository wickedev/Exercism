module String = struct
    include String
    let sort s =  s
        |> String.to_seq 
        |> List.of_seq
        |> List.sort Char.compare
        |> List.to_seq
        |> String.of_seq;;
  end

open String

let eq lower_given sorted_given candidate = 
    let lower_candidate = lowercase_ascii candidate in
    let not_equal = (not (equal lower_given lower_candidate)) in
    let sorted_equal = equal sorted_given (sort lower_candidate) in
    match (not_equal && sorted_equal) with
     | true -> (Some candidate)
     | false ->  None

let anagrams given candidates = 
    let lower_given = (lowercase_ascii given) in
    let given's_anagram  = eq lower_given @@ (sort lower_given) in
    candidates |> List.filter_map given's_anagram
