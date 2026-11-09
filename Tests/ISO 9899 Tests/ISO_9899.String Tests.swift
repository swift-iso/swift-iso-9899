import Testing

@testable import ISO_9899

enum `ISO_9899.String Tests` {}

extension `ISO_9899.String Tests` {
    @Suite
    struct `ISO_9899.String - Ownership` {

        @Test
        func `allocated buffer is adopted and handed back by take`() {
            let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 4)
            unsafe buffer.initialize(from: [0x61, 0x62, 0x63, 0x00], count: 4)
            let string = unsafe ISO_9899.String(allocated: buffer, count: 3)
            #expect(string.count == 3)
            let taken = unsafe string.take()
            #expect(unsafe taken.pointer == buffer)
            #expect(unsafe taken.count == 3)
            unsafe taken.pointer.deallocate()
        }

        @Test
        func `allocated buffer is freed by the string`() {
            let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 2)
            unsafe buffer.initialize(from: [0x7A, 0x00], count: 2)
            let string = unsafe ISO_9899.String(allocated: buffer, count: 1)
            #expect(string.count == 1)
        }

        @Test
        func `copying a pointer owns an equal terminated copy`() {
            let source: [ISO_9899.String.Char] = [0x68, 0x69, 0x00]
            let original = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: 3)
            defer { unsafe original.deallocate() }
            unsafe original.initialize(from: source, count: 3)
            let string = unsafe ISO_9899.String(copying: UnsafePointer(original))
            #expect(unsafe !string.withUnsafePointer { pointer in unsafe pointer == UnsafePointer(original) })
            #expect(string.count == 2)
            let bytes = unsafe string.withUnsafePointer { pointer in
                unsafe [pointer[0], pointer[1], pointer[2]]
            }
            #expect(bytes == source)
        }
    }
}
