import Foundation

public struct AskLayout: Codable, Hashable
{
    public let type: String // = ask

    /// This is an array of block indices that are a part of the ask content of the Post.
    /// Any blocks not specified in the blocks array should be considered a part of the
    /// ask's "answer" content.
    public let blocks: [Int]

    /// If the ask is not anonymous, this will include information about the blog that
    /// submitted the ask.
    public let attribution: AttributionObject?

    public init(attribution: AttributionObject?, blocks: [Int], type: String) {
        self.blocks = blocks
        self.attribution = attribution
        self.type = type
    }
}
