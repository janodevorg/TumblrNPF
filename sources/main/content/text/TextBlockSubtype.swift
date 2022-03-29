#if os(macOS)
import Foundation
#else
import UIKit
#endif

public enum TextBlockSubtype: String, Codable, Equatable
{
    /// Intended for Post headings.
    case heading1

    /// Intended for section subheadings.
    case heading2

    /// Tumblr Official clients display this with a large cursive font.
    case quirky

    /// Intended for short quotations, official Tumblr clients display this with a large serif font.
    case quote

    /// Intended for longer quotations or photo captions, official Tumblr clients indent this text block.
    case indented

    /// Intended to mimic the behavior of the Chat Post type, official Tumblr clients display this with a monospace font.
    case chat

    /// Intended to be an ordered list item prefixed by a number, see next section.
    case orderedListItem = "ordered-list-item"

    /// Intended to be an unordered list item prefixed with a bullet, see next section.
    case unorderedListItem = "unordered-list-item"

    case unknown

    public init(from decoder: Decoder) throws {
        let string = try decoder.singleValueContainer().decode(RawValue.self)
        self = TextBlockSubtype(rawValue: string) ?? .unknown
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

#if os(iOS)
    public var font: UIFont {
        let defaultFont = UIFont.preferredFont(forTextStyle: .body)
        switch self {
        case .heading1: return UIFont.preferredFont(forTextStyle: .title1)
        case .heading2: return UIFont.preferredFont(forTextStyle: .title2)
        case .quirky: return UIFont(name: "RugeBoogie-Regular", size: 17.0) ?? defaultFont
        case .quote: return UIFont(name: "Helvetica Neue Italic", size: 20.0) ?? defaultFont
        case .indented: return UIFont.preferredFont(forTextStyle: .caption1)
        case .chat: return UIFont(name: "Courier", size: 17.0) ?? defaultFont
        case .orderedListItem: return UIFont.preferredFont(forTextStyle: .body)
        case .unorderedListItem: return UIFont.preferredFont(forTextStyle: .body)
        case .unknown: return defaultFont
        }
    }
#endif
}
