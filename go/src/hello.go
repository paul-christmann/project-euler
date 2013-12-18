package main

import (
  "fmt"
  "util/math"
)

func main() {
    fmt.Printf("hello, world\n")
    
    multiples := math.Multiples(3,16)
    for i:=0;i<len(multiples);i++ {
      fmt.Printf("Multiple %d is %d\n", i+1, multiples[i])
    }
    
}