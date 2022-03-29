import Foundation

public enum PaywallAccess: String, Codable, Hashable
{
    case creator
    case member
    case nonMember = "non-member"
    case disabled

    public enum CodingKeys: String, CodingKey {
        case creator
        case member
        case nonMember = "non-member"
        case disabled
    }
}
