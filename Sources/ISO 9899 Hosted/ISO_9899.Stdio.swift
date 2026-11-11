internal import ISO_9899_Stdio_Shims

extension ISO_9899 {

    public enum Stdio {}
}

extension ISO_9899.Stdio {

    @discardableResult
    public static func put(
        _ string: UnsafePointer<CChar>,
        to stream: Stream
    ) -> Bool {
        switch stream {
        case .output:
            return unsafe iso9899_fputs_stdout(string) != iso9899_eof()

        case .error:
            return unsafe iso9899_fputs_stderr(string) != iso9899_eof()
        }
    }
}
