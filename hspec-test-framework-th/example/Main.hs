{-# LANGUAGE TemplateHaskell #-}
module Main where
import Test.HUnit
import Test.Framework.TH
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

main :: IO ()
main = $(defaultMainGenerator)

case_1 :: Assertion
case_1 = do 1 @=? (1 :: Int)

case_2 :: Assertion
case_2 = do 2 @=? (2 :: Int)

prop_reverse :: [Int] -> Bool
prop_reverse xs = reverse (reverse xs) == xs
