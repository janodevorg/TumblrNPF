#if os(macOS)
import Foundation
#else
import UIKit
#endif

public struct Formatting: Codable, Hashable, Equatable
{
    public let blog: Blog?

    /// The ending index of the formatting range (exclusive)
    public let end: Int

    /// The starting index of the formatting range (inclusive)
    public let start: Int

    /// The type of formatting range.
    /// Possible values: `bold`, `color`, `italic`, `link`, `strikethrough`, `small`.
    public let type: FormatType

    /// Only present when the type is link
    public let url: URL?

    /// The color to use, in standard hex format, with leading #.
    /// Only present when the type is color
    public let hex: String?

    public enum CodingKeys: String, CodingKey {
        case blog, end, start, type, url, hex
    }

#if os(iOS)
    public var font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
#endif

    public init(blog: Blog?, end: Int, start: Int, type: FormatType, url: URL?, hex: String?) {
        self.blog = blog
        self.end = end
        self.start = start
        self.type = type
        self.url = url
        self.hex = hex
    }
}
