module Test.Framework.Providers.HUnit where

import           Test.HUnit (Assertion)
import qualified Test.HUnit as HUnit
import           Test.Hspec.Core
import           Test.Hspec.HUnit

import           Test.Framework.Providers.API

testCase :: TestName -> Assertion -> Test
testCase = it

hUnitTestToTests :: HUnit.Test -> [Test]
hUnitTestToTests = runSpecM . fromHUnitTest
