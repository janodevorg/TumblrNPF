import Foundation

public struct BlogsPage: Codable, Hashable
{
    public let blogs: [Blog]
    public let links: Links

    public enum CodingKeys: String, CodingKey {
        case blogs
        case links = "_links"
    }
}
