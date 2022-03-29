import Foundation

public struct LinkContent: Codable, Hashable
{
    /// The author of the link's content.
    public let author: String?

    /// The description of where the link goes.
    public let description: String?

    /// Supplied on NPF Post consumption, ignored during NPF Post creation.
    public let displayURL: URL?

    /// An image media object to use as a "poster" for the link.
    public let poster: [MediaObject]?

    /// The name of the site being linked to.
    public let siteName: String?

    /// The title of where the link goes.
    public let title: String?

    public let type: String?

    /// The URL to use for the link block.
    /// 
    ///  If only a url is given with no other fields, we will attempt
    ///  to fetch that link's OpenGraph data during post creation,
    ///  which may populate the other fields.
    public let url: URL

    public enum CodingKeys: String, CodingKey {
        case author
        case description
        case displayURL = "display_url"
        case poster
        case siteName = "site_name"
        case title
        case type
        case url
    }

    public init(author: String?,
                description: String?,
                displayURL: URL?,
                poster: [MediaObject]?,
                siteName: String?,
                title: String?,
                type: String?,
                url: URL) {

        self.author = author
        self.description = description
        self.displayURL = displayURL
        self.poster = poster
        self.siteName = siteName
        self.title = title
        self.type = type
        self.url = url
    }
}
