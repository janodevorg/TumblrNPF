import Foundation

/// Deprecated
public struct CondensedLayout: Codable, Hashable
{
    /// This is an array of block indices that are a part of the truncated
    /// version of the Post. Required if truncate_after is not supplied.
    /// Must be sequential, not empty, and begin with 0.
    public let blocks: [Int]?

    /// The last block to display before the Read More signifier.
    /// Required if blocks is not supplied.
    public let truncateAfter: Int?
    
    public let type: String // = condensed

    public enum CodingKeys: String, CodingKey {
        case blocks
        case type
        case truncateAfter = "truncate_after"
    }

    public init(blocks: [Int]?, truncateAfter: Int?, type: String) {
        self.blocks = blocks
        self.truncateAfter = truncateAfter
        self.type = type
    }
}
