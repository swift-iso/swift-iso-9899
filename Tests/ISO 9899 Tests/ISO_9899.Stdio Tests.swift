import Testing

@testable import ISO_9899

enum `ISO_9899.Stdio Tests` {}

extension `ISO_9899.Stdio Tests` {
    @Suite
    struct Test {

        @Test
        func `put writes an empty string to standard error`() {
            let written = "".withCString { unsafe ISO_9899.Stdio.put($0, to: .error) }
            #expect(written)
        }

        @Test
        func `put writes an empty string to standard output`() {
            let written = "".withCString { unsafe ISO_9899.Stdio.put($0, to: .output) }
            #expect(written)
        }
    }
}
