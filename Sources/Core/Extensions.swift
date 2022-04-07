import Foundation

extension String {

  /// Use `strerror` to describe given error.
  public init?(errno: Int32) {
    guard let cStr = strerror(errno) else {
      return nil
    }

    self = String(cString: cStr)
  }
}

extension Collection {

  /// A Boolean value that indicates whether the collection has any elements.
  public var hasAny: Bool {
    return !self.isEmpty
  }
}
