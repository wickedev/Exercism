
let square n = n * n

let square_of_sum n = square (n * (n + 1) / 2)

let sum_of_squares n = (n * (n + 1) * (2 * n + 1)) / 6

let difference_of_squares n = (square_of_sum n) - (sum_of_squares n)
