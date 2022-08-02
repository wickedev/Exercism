let acronym text =
  (Str.split (Str.regexp "[ \n\r\x0c\t_-]+") text )
  |> List.map (fun x -> String.get x 0)
  |> List.map Char.uppercase_ascii
  |> Base.String.of_char_list