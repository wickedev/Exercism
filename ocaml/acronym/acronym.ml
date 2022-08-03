module String = struct
  include String
  let first = function 
    | "" -> None
    | s -> Some (String.get s 0)
end

let acronym text = text
  |> Base.String.split_on_chars ~on:[' '; '-'; '_']
  |> List.filter_map String.first
  |> List.map Char.uppercase_ascii
  |> Base.String.of_char_list

(* let is_not_empty x = not @@ (x = "") *)
(* let is_not_empty x = (not (x = "")) *)

(*let acronym text = Base.String.of_char_list
  @@ List.map Char.uppercase_ascii
  @@ List.map String.first
  @@ Str.split (Str.regexp "[ \n\r\x0c\t_-]+") 
  @@ text*)
