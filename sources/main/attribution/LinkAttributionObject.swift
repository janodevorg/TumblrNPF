import Foundation

public struct LinkAttributionObject: Codable, Hashable
{
    public let type: String
    /// The URL of the Post to be attributed.
    public let url: URL

    public enum CodingKeys: String, CodingKey {
        case type
        case url
    }

    public init(type: String, url: URL) {
        self.type = type
        self.url = url
    }
}
