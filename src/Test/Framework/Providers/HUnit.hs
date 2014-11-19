module Test.Framework.Providers.HUnit where

import           Test.HUnit (Assertion)
import qualified Test.HUnit as HUnit
import           Test.Hspec.Core.Spec
import           Test.Hspec.Contrib.HUnit

import           Test.Framework.Providers.API

testCase :: TestName -> Assertion -> Test
testCase = specItem

hUnitTestToTests :: HUnit.Test -> [Test]
hUnitTestToTests = specListFromHUnitTest
