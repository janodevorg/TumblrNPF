import Foundation

public struct ImageContent: Codable, Hashable
{
    /// Text used to describe the image, for screen readers. 4096 character maximum.
    public let altText: String?

    /// See AttributionObject.
    public let attribution: AttributionObject?

    /// A caption typically shown under the image. 4096 character maximum.
    public let caption: String?

    /// Colors used in the image.
    public let colors: [String: String]?

    /// A feedback token to use when this image block is a GIF Search result.
    public let feedbackToken: String?

    /// An array of Media Objects which represent different available sizes of this image asset.
    public let media: [MediaObject]

    /// For GIFs, this is a single-frame "poster"; see the GIF Posters section.
    public let poster: MediaObject?

    public let type: String?

    public enum CodingKeys: String, CodingKey {
        case altText = "alt_text"
        case attribution
        case caption
        case colors
        case feedbackToken = "feedback_token"
        case media
        case poster
        case type
    }

    public init(altText: String?,
                attribution: AttributionObject?,
                caption: String?,
                colors: [String: String]?,
                feedbackToken: String?,
                media: [MediaObject],
                poster: MediaObject?,
                type: String?) {
        self.altText = altText
        self.attribution = attribution
        self.caption = caption
        self.colors = colors
        self.feedbackToken = feedbackToken
        self.media = media
        self.poster = poster
        self.type = type
    }
}
