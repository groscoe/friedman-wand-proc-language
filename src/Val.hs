{-# LANGUAGE FlexibleContexts #-}
module Val (Val (..), val2Int, val2Bool, val2List) where

import Control.Monad.Except (MonadError, throwError)

data Val = VInt  Int
         | VBool Bool
         | VList [Val]

instance Show Val where
  show (VInt i) = show i
  show (VBool b) = show b
  show (VList xs) = show xs

val2Int :: (MonadError String m) => Val -> m Int
val2Int (VInt n) = pure n
val2Int x = typeError "Int" (show x)

val2Bool :: (MonadError String m) => Val -> m Bool
val2Bool (VBool b) = pure b
val2Bool x = typeError "Bool" (show x)

val2List :: (MonadError String m) => Val -> m [Val]
val2List (VList b) = pure b
val2List x = typeError "List" (show x)

typeError :: MonadError String m => String -> String -> m a
typeError expected obtained =
  throwError $ "TypeError: expected " ++ expected ++ ", got " ++ obtained
