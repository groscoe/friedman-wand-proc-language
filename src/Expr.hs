module Expr (Expr (..)) where

import Val

data Expr = I        Int
          | BinOp    String (Int -> Int -> Val) Expr Expr
          | UnOp     String (Int -> Val) Expr
          | Cons     Expr Expr
          | ListUnOp String ([Val] -> Val) Expr
          | Nil
          | If       Expr Expr Expr
          | Var      String
          | Let      [(String, Expr)] Expr
          | LetRec   [(String, Expr)] Expr
          | Unpack   [String] Expr Expr

instance Show Expr where
  show (I i) = show i
  show (BinOp sym _ a b) = showBinOp sym a b
  show (UnOp sym _ x) = showUnOp sym x
  show (ListUnOp sym _ x) = showUnOp sym x
  show c@(Cons _ _) = "list(" ++ showElems c ++ ")"
  show Nil = "emptylist"
  show (If p t e) = "if " ++ show p ++ " then " ++ show t ++ " else " ++ show e
  show (Var v) = v
  show (Let vs body) =
    "let " ++ showAttribs vs ++ " in " ++ show body
  show (LetRec vs body) =
    "let* " ++ showAttribs vs ++ " in " ++ show body
  show (Unpack names expr body) =
    "unpack " ++ unwords names ++ " = " ++ show expr ++ " in " ++ show body

showAttribs :: [(String, Expr)] -> String
showAttribs = unwords . fmap (\(name, expr) -> name ++ " = " ++ show expr)

showElems :: Expr -> String
showElems (Cons x Nil) = show x
showElems (Cons x xs) = show x ++ ", " ++ showElems xs
showElems _ = ""

showBinOp :: String -> Expr -> Expr -> String
showBinOp sym a b = sym ++ "(" ++ show a ++ ", " ++ show b ++ ")"

showUnOp :: String -> Expr -> String
showUnOp sym e = sym ++ "(" ++ show e ++ ")"
