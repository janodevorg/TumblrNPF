import Foundation

public struct RowsLayout: Codable, Hashable
{
    public let type: String // = rows
    public let display: [RowLayout]

    /// The last block to display before the Read More signifier. Required if blocks is not supplied.
    public let truncateAfter: Int?

    public enum CodingKeys: String, CodingKey {
        case type
        case display
        case truncateAfter = "truncate_after"
    }

    public init(display: [RowLayout], truncateAfter: Int?, type: String) {
        self.display = display
        self.truncateAfter = truncateAfter
        self.type = type
    }
}
