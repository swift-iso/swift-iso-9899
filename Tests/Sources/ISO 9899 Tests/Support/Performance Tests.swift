// PerformanceTests.swift
// swift-iso-9899
//
// Top-level performance test suite with serialized execution.
// All performance tests extend this suite via extension in their respective test files.

import StandardsTestSupport
import Testing

@Suite(.serialized)
struct `Performance Tests` {}
