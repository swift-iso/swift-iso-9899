import Testing

@testable import ISO_9899

enum `ISO_9899.String.Borrowed Tests` {}

extension `ISO_9899.String.Borrowed Tests` {
    @Suite
    struct `ISO_9899.String.Borrowed - Termination` {

        @Test
        func `terminated pointer is borrowed with its count`() {
            let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 3)
            defer { unsafe buffer.deallocate() }
            unsafe buffer.initialize(from: [0x61, 0x62, 0x00], count: 3)
            let view = unsafe ISO_9899.String.Borrowed(UnsafePointer(buffer), count: 2)
            #expect(view.count == 2)
        }

        @Test
        func `count that misses the terminator traps`() async {
            await #expect(processExitsWith: .failure) {
                let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 3)
                unsafe buffer.initialize(from: [0x61, 0x62, 0x00], count: 3)
                let view = unsafe ISO_9899.String.Borrowed(UnsafePointer(buffer), count: 1)
                _ = view.count
            }
        }

        @Test
        func `allocated buffer that misses the terminator traps`() async {
            await #expect(processExitsWith: .failure) {
                let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 3)
                unsafe buffer.initialize(from: [0x61, 0x62, 0x00], count: 3)
                let string = unsafe ISO_9899.String(allocated: buffer, count: 1)
                _ = string.count
            }
        }
    }
}
