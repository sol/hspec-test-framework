module Test.Framework.Providers.QuickCheck2 where

import           Test.QuickCheck
import           Test.Hspec.Core

import           Test.Framework.Providers.API

testProperty :: Testable a => TestName -> a -> Test
testProperty name = it name . property
