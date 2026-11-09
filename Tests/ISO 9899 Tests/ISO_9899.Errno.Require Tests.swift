import Testing

@testable import ISO_9899

enum `ISO_9899.Errno.Require Tests` {}

extension `ISO_9899.Errno.Require Tests` {
    @Suite
    struct `ISO_9899.Errno.Require - Failure` {

        @Test
        func `failure without errno throws unset`() {
            #expect(throws: ISO_9899.Errno.Require.Error.unset) {
                try ISO_9899.Errno.Require.int { -1 }
            }
        }

        @Test
        func `failure with errno throws its code`() {
            #expect(throws: ISO_9899.Errno.Require.Error.code(.inval)) {
                try ISO_9899.Errno.Require.int {
                    ISO_9899.Errno.set(.inval)
                    return -1
                }
            }
        }

        @Test
        func `nil pointer without errno throws unset`() {
            let thrown = #expect(throws: ISO_9899.Errno.Require.Error.self) {
                _ = try unsafe ISO_9899.Errno.Require.rawPointer { nil }
            }
            #expect(thrown == .unset)
        }

        @Test
        func `success returns the result`() throws {
            let result = try ISO_9899.Errno.Require.int { 7 }
            #expect(result == 7)
        }
    }
}
