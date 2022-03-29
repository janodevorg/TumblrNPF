import Foundation

public struct PostAttributionObject: Codable, Hashable
{
    /// A Tumblelog object with at least a uuid field.
    public let blog: Blog

    /// The URL of the Post to be attributed.
    public let url: URL

    /// A Post object with at least an id field.
    public let post: Post

    /// Type
    public let type: String

    public enum CodingKeys: String, CodingKey {
        case blog
        case url
        case post
        case type
    }

    public init(blog: Blog, url: URL, post: Post, type: String) {
        self.blog = blog
        self.url = url
        self.post = post
        self.type = type
    }
}
