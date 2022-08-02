module String = struct
  include String
  let first (s: string): char = String.get s 0
end

let acronym text = text
  |> Str.split (Str.regexp "[ \n\r\x0c\t_-]+") 
  |> List.map String.first
  |> List.map Char.uppercase_ascii
  |> Base.String.of_char_list 

(*let acronym text = Base.String.of_char_list
  @@ List.map Char.uppercase_ascii
  @@ List.map String.first
  @@ Str.split (Str.regexp "[ \n\r\x0c\t_-]+") 
  @@ text*)
