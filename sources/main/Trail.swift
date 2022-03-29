import Foundation

/// The reblog trail items, if any.
public struct Trail: Codable, Hashable
{
    /// An object with information about the Post in the reblog trail;
    /// contains at least an id field and possibly a timestamp field
    /// for when that post was created.
    public let post: Post?

    /// An object with information about the Post's blog in the reblog
    /// trail; contains at least a uuid field.
    public let blog: Blog?

    /// The content of the Post in the trail.
    public let content: [Content]

    /// The layout to use for the content of the Post in the trail.
    public let layout: [Layout]

    /// The name of the blog from a broken trail item.
    public let brokenBlogName: String?

    public enum CodingKeys: String, CodingKey {
        case post
        case blog
        case content
        case layout
        case brokenBlogName = "broken_blog_name"
    }

    public init(post: Post?,
         blog: Blog?,
         content: [Content],
         layout: [Layout],
         brokenBlogName: String?)
    {
        self.post = post
        self.blog = blog
        self.content = content
        self.layout = layout
        self.brokenBlogName = brokenBlogName
    }
}
