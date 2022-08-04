type allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats

let allergens = [Eggs; Peanuts; Shellfish; Strawberries; Tomatoes; Chocolate; Pollen; Cats]

let allergy_test = function 
    | Eggs -> 1
    | Peanuts -> 2
    | Shellfish -> 4
    | Strawberries -> 8
    | Tomatoes -> 16
    | Chocolate -> 32
    | Pollen -> 64
    | Cats -> 128

let allergic_to score allergen = 
    let tested = allergy_test allergen in 
    (score land tested) = tested

let allergies score = allergens
    |> List.filter (allergic_to score)
