import Foundation

/**
 Attempt to render the first of the following:
 - `media`
 - `metadata`
 - `embedHTML`
 - `embedIFrame`
 - `embedURL`
 - `url`
 */
public struct VideoContent: Codable, Hashable
{
    /// Optional attribution information about where the video came from.
    public let attribution: AttributionObject?

    /// Whether this video can be played on a cellular connection.
    public let canAutoplayOnCellular: Bool? // swiftlint:disable:this discouraged_optional_boolean

    /// HTML code that could be usedz to embed this video into a webpage.
    public let embedHTML: String?

    /// An embed iframe object used for constructing video iframes.
    public let embedIFrame: EmbedVideoIframe?

    /// A URL to the embeddable content to use as an iframe.
    public let embedURL: URL?

    public let filmstrip: [MediaObject]?

    /// The Media Object to use for the video block, if no url is present.
    public let media: MediaObject?

    /// Optional provider-specific metadata about the video.
    // let metadata: object?

    /// The provider of the video, whether it's tumblr for native video or a trusted third party.
    public let provider: String?

    /// An image media object to use as a "poster" for the video, usually a single frame.
    public let poster: [MediaObject]?

    public let type: String?

    /// The URL to use for the video block, if no media is present.
    public let url: URL?

    public enum CodingKeys: String, CodingKey {
        case attribution
        case canAutoplayOnCellular = "can_autoplay_on_cellular"
        case embedHTML = "embed_html"
        case embedIFrame = "embed_iframe"
        case embedURL = "embed_url"
        case filmstrip
        case media
        // case metadata
        case provider
        case poster
        case type
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attribution = try container.decodeIfPresent(AttributionObject.self, forKey: .attribution)
        self.canAutoplayOnCellular = try container.decodeIfPresent(Bool.self, forKey: .canAutoplayOnCellular)
        self.embedHTML = try container.decodeIfPresent(String.self, forKey: .embedHTML)
        self.embedIFrame = try container.decodeIfPresent(EmbedVideoIframe.self, forKey: .embedIFrame)
        self.embedURL = try container.decodeIfPresent(URL.self, forKey: .embedURL)
        if let filmstrip = try? container.decodeIfPresent(MediaObject.self, forKey: .filmstrip) {
            self.filmstrip = [filmstrip]
        } else if let filmstrip = try? container.decodeIfPresent([MediaObject].self, forKey: .filmstrip) {
            self.filmstrip = filmstrip
        } else {
            self.filmstrip = nil
        }
        self.media = try container.decodeIfPresent(MediaObject.self, forKey: .media)
        self.provider = try container.decodeIfPresent(String.self, forKey: .provider)
        self.poster = try container.decodeIfPresent([MediaObject].self, forKey: .poster)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(attribution, forKey: .attribution)
        try container.encode(canAutoplayOnCellular, forKey: .canAutoplayOnCellular)
        try container.encode(embedHTML, forKey: .embedHTML)
        try container.encode(embedIFrame, forKey: .embedIFrame)
        try container.encode(embedURL, forKey: .embedURL)
        try container.encode(filmstrip, forKey: .filmstrip)
        try container.encode(media, forKey: .media)
        try container.encode(provider, forKey: .provider)
        try container.encode(poster, forKey: .poster)
        try container.encode(type, forKey: .type)
        try container.encode(url, forKey: .url)
    }

    public init(attribution: AttributionObject?,
                canAutoplayOnCellular: Bool?,
                embedHTML: String?,
                embedIFrame: EmbedVideoIframe?,
                embedURL: URL?,
                filmstrip: [MediaObject]?,
                media: MediaObject?,
                provider: String?,
                poster: [MediaObject]?,
                type: String?,
                url: URL?) {
        self.attribution = attribution
        self.canAutoplayOnCellular = canAutoplayOnCellular
        self.embedHTML = embedHTML
        self.embedIFrame = embedIFrame
        self.embedURL = embedURL
        self.filmstrip = filmstrip
        self.media = media
        self.provider = provider
        self.poster = poster
        self.type = type
        self.url = url
    }
}
