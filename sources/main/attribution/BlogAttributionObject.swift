import Foundation

public struct BlogAttributionObject: Codable, Hashable
{
    /// A Tumblelog object with at least a uuid field.
    public let blog: Blog

    public let type: String
    public let url: URL?

    public enum CodingKeys: String, CodingKey {
        case blog
        case type
        case url
    }

    public init(blog: Blog, type: String, url: URL?) {
        self.blog = blog
        self.type = type
        self.url = url
    }
}
