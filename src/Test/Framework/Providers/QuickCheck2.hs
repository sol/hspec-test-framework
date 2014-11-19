module Test.Framework.Providers.QuickCheck2 where

import           Test.QuickCheck
import           Test.Hspec.Core.Spec

import           Test.Framework.Providers.API

testProperty :: Testable a => TestName -> a -> Test
testProperty name = specItem name . property
