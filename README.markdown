A `test-framework` compatibility layer on top of Hspec, it allows you to run
`test-framework` tests with Hspec unmodified.

All that is required is to remove

 * `test-framework`
 * `test-framework-quickcheck2`
 * `test-framework-hunit`
 * `test-framework-th`

from the `build-depends` section of your cabal file and add

 * `hspec-test-framework`
 * `hspec-test-framework-th`

in theire place.

__NOTE:__ The packages `hspec-test-framework` and `hspec-test-framework-th` are
hidden by default, so that they do not interfere with an installed version of
`test-framework`.  If you want to use them with e.g. `ghci`, you have to pass
the command-line flags
`-packagehspec-test-framework -packagehspec-test-framework-th`
to GHC.
