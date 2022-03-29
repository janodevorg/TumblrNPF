import Foundation

public struct RowLayout: Codable, Hashable
{
    public let blocks: [Int]
    public let mode: RowLayoutMode? // this should have a default value of `weighted` when nil

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blocks = try container.decode([Int].self, forKey: .blocks)
        self.mode = try container.decodeIfPresent(RowLayoutMode.self, forKey: .mode) ?? RowLayoutMode(type: "weighted")
    }

    public init(blocks: [Int], mode: RowLayoutMode?) {
        self.blocks = blocks
        self.mode = mode
    }
}
