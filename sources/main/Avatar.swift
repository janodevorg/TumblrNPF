import Foundation

public struct Avatar: Codable, Hashable
{
    public let height: Int
    public let url: URL
    public let width: Int

    public init(height: Int, url: URL, width: Int) {
        self.height = height
        self.url = url
        self.width = width
    }
}
