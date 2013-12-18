package math

func Multiples(number int, maximum int) []int {
  var result []int
  var next_multiple = number
  for next_multiple < maximum {
    result = append(result, next_multiple)
    next_multiple += number
  }
  return result
}
