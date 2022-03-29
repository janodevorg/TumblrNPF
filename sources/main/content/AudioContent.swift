import Foundation

public struct AudioContent: Codable, Hashable
{
    /// The album from which the audio asset originated.
    public let album: String?

    /// The artist of the audio asset.
    public let artist: String?

    /// Optional attribution information about where the audio track came from.
    public let attribution: AttributionObject?

    /// HTML code that could be used to embed this audio track into a webpage.
    public let embedHTML: String?

    /// A URL to the embeddable content to use as an iframe.
    public let embedURL: URL?

    /// The Media Object to use for the audio block, if no url is present.
    public let media: MediaObject?

    /// Optional provider-specific metadata about the audio track.
    // public let metadata: ??

    /// An image media object to use as a "poster" for the audio track, usually album art.
    public let poster: [MediaObject]?

    /// The provider of the audio source, whether it's tumblr for native audio or a trusted third party.
    public let provider: String?

    /// The title of the audio asset.
    public let title: String?

    public let type: String?

    /// The URL to use for the audio block, if no media is present.
    public let url: URL?

    public enum CodingKeys: String, CodingKey {
        case album
        case artist
        case attribution
        case embedHTML
        case embedURL
        case media
        case poster
        case provider
        case title
        case type
        case url
    }

    public init(
        album: String?,
        artist: String?,
        attribution: AttributionObject?,
        embedHTML: String?,
        embedURL: URL?,
        media: MediaObject?,
        poster: [MediaObject]?,
        provider: String?,
        title: String?,
        type: String?,
        url: URL?
    ) {
        self.album = album
        self.artist = artist
        self.attribution = attribution
        self.embedHTML = embedHTML
        self.embedURL = embedURL
        self.media = media
        self.poster = poster
        self.provider = provider
        self.title = title
        self.type = type
        self.url = url
    }
}
