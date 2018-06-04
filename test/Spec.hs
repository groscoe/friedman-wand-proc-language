module Test where

import Eval (run)

-- examples
ex0, ex1, ex2, ex3, ex4, ex5, ex6, ex7 :: String

-- 55
ex0 = "let f = proc (x) -(x,11)\n\
      \in (f (f 77))"

-- 55
ex1 = "(proc (f) (f (f 77))\n\
       \proc (x) -(x,11))"

-- -100
ex2 = "let x = 200\n\
      \in let f = proc (z) -(z,x)\n\
      \  in let x = 100\n\
      \     in let g = proc (z) -(z,x)\n\
      \        in -((f 1), (g 1))"

-- 7
ex3 = "let sum = proc (x) proc (y) +(x, y)\n\
      \in ((sum 3) 4)"

-- 12
ex4 = "let makemult = proc (maker)\n\
      \                 proc (x)\n\
      \                   if zero?(x)\n\
      \                   then 0\n\
      \                   else -(((maker maker) -(x,1)), -4)\n\
      \in let times4 = proc (x) ((makemult makemult) x)\n\
      \   in (times4 3)"

-- 12
ex5 = "let makerec = proc (f)\n\
      \                     let d = proc (x)\n\
      \                              proc (z) ((f (x x)) z)\n\
      \                     in proc (n) ((f (d d)) n)\n\
      \in let maketimes4 = proc (f) proc (x)\n\
      \                            if zero?(x)\n\
      \                            then 0\n\
      \                            else -((f -(x,1)), -4)\n\
      \   in let times4 = (makerec maketimes4) in (times4 3)"

-- 6
ex6 = "let a = 3\n\
      \in let p = proc (x) -(x,a)\n\
      \             a = 5\n\
      \   in -(a,(p 2))"

-- 3
ex7 = "let a = 3\n\
      \in let p = proc (z) a\n\
      \   in let f = proc (x) (p 0)\n\
      \      in let a = 5\n\
      \         in (f 2)"
