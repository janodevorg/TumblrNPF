import Foundation

public struct RowLayoutMode: Codable, Hashable {
    public let type: String // e.g. carousel

    public init(type: String) {
        self.type = type
    }
}
