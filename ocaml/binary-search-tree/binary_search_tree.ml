open Base

type bst = Empty | Node of {value: int; left: bst; right: bst}

let empty = Empty

let value bst' =
  match bst' with
  | Empty -> Result.Error "empty"
  | Node {value; _} -> Result.Ok value

let left bst' =
  match bst' with
  | Empty -> Result.Error "empty"
  | Node {left; _} -> Result.Ok left

let right bst' =
  match bst' with
  | Empty -> Result.Error "empty"
  | Node {right; _} -> Result.Ok right

let rec insert x bst' =
  match bst' with
  | Empty -> Node {value= x; left= Empty; right= Empty}
  | Node {value; left; right} when value < x ->
      Node {value; left; right= insert x right}
  | Node {value; left; right} -> Node {value; left= insert x left; right}

let rec to_list bst' =
  match bst' with
  | Empty -> []
  | Node {value; left; right} -> to_list left @ (value :: to_list right)
