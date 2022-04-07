========================
=== Extensions.swift ===
========================

extension String {
  public init?(errno: Int32)
}

extension Collection {
  public var hasAny: Bool { get }
}

==================
=== Trap.swift ===
==================

public func trap(_ msg: String, file: StaticString = #file, function: StaticString = #function, line: Int = #line) -> Never

