import Foundation

public struct BlogResponse: Codable, Hashable
{
    public let blog: Blog
    public let links: Links
    public let posts: [Post]
    public let totalPosts: Int?

    public enum CodingKeys: String, CodingKey {
        case blog
        case links = "_links"
        case posts
        case totalPosts = "total_posts"
    }
}
