import Foundation

/// where does this appear?
public struct EmbedVideoIframe: Codable, Hashable {
    public let url: URL
    public let width: Int
    public let height: Int

    public init(height: Int, url: URL, width: Int) {
        self.height = height
        self.url = url
        self.width = width
    }
}
