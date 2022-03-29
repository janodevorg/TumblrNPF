import Foundation

public protocol MirrorDescripting: CustomStringConvertible {}

public extension MirrorDescripting {
    var description: String {
        Mirror(reflecting: self)
            .children
            .compactMap { child in
                child.label.flatMap { "\($0): \(child.value)" }
            }
            .joined(separator: "\n\t")
    }
}
