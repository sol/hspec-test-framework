{-# OPTIONS_GHC -XTemplateHaskell #-}
import Test.Hspec
import Test.Framework.TH
import Data.IORef
import System.IO.Unsafe

spec_foo :: SpecWith ()
spec_foo = describe "foo" $ do
  it "should add stuff" $ do
    _ <- writeIORef fooWasCalledIORef True
    (3 + 4) `shouldBe` (7 :: Int)

spec_bar :: SpecWith ()
spec_bar = describe "bar" $ do
  it "should know what's what" $ do
    _ <- writeIORef barWasCalledIORef True
    "foo" `shouldNotBe` "bar"

fooWasCalledIORef :: IORef Bool
{-# NOINLINE fooWasCalledIORef #-}
fooWasCalledIORef = unsafePerformIO $ newIORef False

barWasCalledIORef :: IORef Bool
{-# NOINLINE barWasCalledIORef #-}
barWasCalledIORef = unsafePerformIO $ newIORef False

main :: IO ()
main = do
  readIORef fooWasCalledIORef >>= shouldBe False
  readIORef barWasCalledIORef >>= shouldBe False

  hspec $(allSpecsGenerator)

  readIORef fooWasCalledIORef >>= shouldBe True
  readIORef barWasCalledIORef >>= shouldBe True
