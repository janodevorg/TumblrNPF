import Foundation

public struct AppAttributionObject: Codable, Hashable
{
    /// The name of the application to be attributed.
    public let appName: String?

    /// Any display text that the client should use with the attribution.
    public let displayText: String?

    /// A specific logo Media Object that the client should use with the third-party app attribution.
    public let logo: MediaObject?

    /// Attribution type
    public let type: String

    /// The URL of the Post to be attributed.
    public let url: URL

    public enum CodingKeys: String, CodingKey {
        case appName = "app_name"
        case displayText = "display_text"
        case logo
        case type
        case url
    }

    public init(appName: String?, displayText: String?, logo: MediaObject?, type: String, url: URL) {
        self.appName = appName
        self.displayText = displayText
        self.logo = logo
        self.type = type
        self.url = url
    }
}
