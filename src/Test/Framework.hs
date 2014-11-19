module Test.Framework where

import           Test.Hspec.Core.Spec
import           Test.Hspec.Runner

import           Test.Framework.Providers.API

defaultMain :: [Test] -> IO ()
defaultMain = hspec . parallel . fromSpecList

testGroup :: TestName -> [Test] -> Test
testGroup = specGroup
