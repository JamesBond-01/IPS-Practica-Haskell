{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
contador :: [a] -> Int
contador [] = 0
contador (x:xs) = 1 + contador xs