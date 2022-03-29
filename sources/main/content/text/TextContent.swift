import Foundation

/// Appears at `"post": { "content": [TextBlock] }`.
public struct TextContent: Codable, Hashable
{
    /// Inline Formatting
    public let formatting: [Formatting]?

    /// Used to create nested lists
    /// It appears in text blocks of subtype ordered-list-item, unordered-list-item, or indented (blockquotes).
    public let indentLevel: Int?

    public let subtype: TextBlockSubtype?

    public let text: String

    public let type: String

    /// Inline Mentions, Inline links, or Other Inline Formatting
    /// See https://www.tumblr.com/docs/npf#text-block-subtypes

    public enum CodingKeys: String, CodingKey
    {
        case formatting
        case indentLevel = "indent_level"
        case subtype
        case text
        case type
    }

    public init(formatting: [Formatting]?,
                indentLevel: Int?,
                subtype: TextBlockSubtype?,
                text: String,
                type: String) {
        self.formatting = formatting
        self.indentLevel = indentLevel
        self.subtype = subtype
        self.text = text
        self.type = type
    }
}
