public import ISO_9899_Errno_Shims


extension ISO_9899.Errno {
    public struct Code: RawRepresentable, Equatable, Hashable, Sendable, Swift::Error {
        public let rawValue: Int32

        @inline(always)
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}
