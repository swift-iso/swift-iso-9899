# swift-iso-9899

Use this package when you need the C standard library from Swift without Foundation: the math functions, errno, the string and memory functions, and in the hosted library character classes, number parsing and allocation. Start from `ISO_9899.Math` for math, or from the `c` view on a `Double` or `Float` for the same functions as members. Use `ISO_9899.Errno` to read and throw errno, and `ISO_9899.String` to own a null-terminated byte string. For POSIX interfaces beyond the C standard, use swift-iso-9945.

## Laws

- Every function calls the platform's C library, so results, accuracy and special values are the platform's. On the platforms tested they follow C Annex F: for example `ISO_9899.Math.pow(_:_:)` returns 1 for an exponent of zero even when the base is NaN, and the square root of a negative number is NaN.
- `ISO_9899.Math.round(_:)` and `Double.C.roundToInt()` round halves away from zero. `ISO_9899.Math.rint(_:)`, `ISO_9899.Math.nearbyint(_:)` and `Double.C.roundedToInt()` round in the current rounding mode, which is halves to even by default.
- The comparison functions are false when either value is NaN, and only `ISO_9899.Math.isunordered(_:_:)` is true. So `Double.C.isNotEqual(to:)` is false for two NaNs, unlike `!=`.
- `ISO_9899.Math.FloatingPointClass` has its own raw values, 0 to 4. They are not the platform's FP_ constants.
- The `ISO_9899.Errno.Require` helpers clear errno, run the call, and throw the current errno if the result signals failure: a nil pointer, -1, or zero for `ISO_9899.Errno.Require.nonZero(_:)`. A call that fails without setting errno throws `ISO_9899.Errno.Code.success`.
- `ISO_9899.Errno.capture(_:)` clears errno before the call, so the code it returns was set by that call or is zero.
- An `ISO_9899.String` owns its buffer and frees it when it goes away. `ISO_9899.String.take()` hands the buffer back without freeing it. `ISO_9899.String.count` does not include the terminator.
- `ISO_9899.String` and `ISO_9899.String.Borrowed` check that the byte at `count` is the terminator only in debug builds.
- `ISO_9899.String.Comparison.compare(_:_:)` reduces the C result to less, equal or greater, and `ISO_9899.String.Comparison.equals(_:_:)` is true only when the string ends exactly where the literal ends.
