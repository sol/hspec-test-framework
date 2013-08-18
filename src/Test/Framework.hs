module Test.Framework where

import           Test.Hspec (parallel)
import           Test.Hspec.Core (fromSpecList, describe)
import           Test.Hspec.Runner (hspec)

import           Test.Framework.Providers.API

defaultMain :: [Test] -> IO ()
defaultMain = hspec . parallel . fromSpecList

testGroup :: TestName -> [Test] -> Test
testGroup = describe
