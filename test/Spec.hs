module Test where

import Eval (run)

-- examples
ex0, ex1, ex2, ex3, ex4, ex5, ex6, ex7, ex8, ex9 :: String
ex0 = "let x = 3 in -(55, -(x, 11))"

ex1 = "let x = 5 in -(x, 3)"

ex2 =
  "let z = 5\n\
  \in let x = 3\n\
  \   in let y = -(x, 1)\n\
  \      in let x = 4\n\
  \         in -(z, -(x, y))"

ex3 =
  "let x = 7\n\
  \in let y = 2\n\
  \   in let y = let x = -(x, 1)\n\
  \              in -(x, y)\n\
  \      in -(-(x,8), y)"

ex4 = "let x = 33\n\
      \in let y = 22\n\
      \   in if zero?(-(x,11))\n\
      \      then -(y,2)\n\
      \      else -(y,4)"

ex5 =
  "let x = 4\n\
  \in cons(x,\n\
  \          cons(cons(-(x,1),\n\
  \                    emptylist),\n\
  \               emptylist))"

ex6 = "let x = 4\n\
      \in list(x, -(x,1), -(x,3))"

ex7 =
  "let x = 30\n\
  \in let x = -(x, 1)\n\
  \       y = -(x, 2)\n\
  \   in -(x, y)"

ex8 =
  "let x = 30\n\
  \in let* x = -(x,1) y = -(x,2)\n\
  \   in -(x,y)"

ex9 =
  "let u = 7\n\
  \in unpack x y = cons(u,cons(3,emptylist))\n\
  \   in -(x,y)"
