import Foundation
import CodableHelpers

// swiftlint:disable discouraged_optional_boolean
public struct Blog: Codable, Hashable, MirrorDescripting
{
    public var allowSearchIndexing: Bool?
    public var ask: Bool?
    public var askPageTitle: String?
    public var avatar: [Avatar]?
    public var canBeFollowed: Bool?
    public var canSubmit: Bool?
    public var canSubscribe: Bool?
    public var followed: Bool?
    public var isBlockedFromPrimary: Bool?
    public var isHiddenFromBlogNetwork: Bool?
    public var isOptoutAds: Bool?
    public var name: String?
    public var paywallAccess: CodableBoolOrString?
    public var posts: [Post]?
    public var shareLikes: Bool?
    public var subscribed: Bool?
    // extra key if this blog is in a trail: subscriptionPlan
    public var subscriptionPlan: SubscriptionPlan?
    public var theme: Theme?
    public var title: String?
    public var url: URL?
    public var uuid: String?

    public enum CodingKeys: String, CodingKey {
        case avatar
        case canBeFollowed = "can_be_followed"
        case followed
        case name
        case posts
        case theme
        case title
        case uuid
        case url
        case subscriptionPlan = "subscription_plan"

        // Single blog attributes. These appear when retrieving a blog by id.
        case paywallAccess = "paywall_access"
        case shareLikes = "share_likes"
        case canSubscribe = "can_subscribe"
        case subscribed = "subscribed"
        case ask = "ask"
        case canSubmit = "can_submit"
        case isBlockedFromPrimary = "is_blocked_from_primary"
        case askPageTitle = "ask_page_title"
        case allowSearchIndexing = "allow_search_indexing"
        case isHiddenFromBlogNetwork = "is_hidden_from_blog_network"
        case isOptoutAds = "is_optout_ads"
    }

    public init(uuid: String) {
        self.uuid = uuid
    }

    public init(allowSearchIndexing: Bool?,
        ask: Bool?,
        askPageTitle: String?,
        avatar: [Avatar]?,
        canBeFollowed: Bool?,
        canSubmit: Bool?,
        canSubscribe: Bool?,
        followed: Bool?,
        isBlockedFromPrimary: Bool?,
        isHiddenFromBlogNetwork: Bool?,
        isOptoutAds: Bool?,
        name: String?,
        paywallAccess: Bool?,
        posts: [Post]?,
        shareLikes: Bool?,
        subscribed: Bool?,
        subscriptionPlan: SubscriptionPlan?,
        theme: Theme?,
        title: String?,
        url: URL?,
        uuid: String?)
    {
        self.allowSearchIndexing = allowSearchIndexing
        self.ask = ask
        self.askPageTitle = askPageTitle
        self.avatar = avatar
        self.canBeFollowed = canBeFollowed
        self.canSubmit = canSubmit
        self.canSubscribe = canSubscribe
        self.followed = followed
        self.isBlockedFromPrimary = isBlockedFromPrimary
        self.isHiddenFromBlogNetwork = isHiddenFromBlogNetwork
        self.isOptoutAds = isOptoutAds
        self.name = name
        self.paywallAccess = paywallAccess
        self.posts = posts
        self.shareLikes = shareLikes
        self.subscribed = subscribed
        self.subscriptionPlan = subscriptionPlan
        self.theme = theme
        self.title = title
        self.url = url
        self.uuid = uuid
    }

    public func setting(posts: [Post]) -> Blog {

        Blog(
            allowSearchIndexing: allowSearchIndexing,
            ask: ask,
            askPageTitle: askPageTitle,
            avatar: avatar,
            canBeFollowed: canBeFollowed,
            canSubmit: canSubmit,
            canSubscribe: canSubscribe,
            followed: followed,
            isBlockedFromPrimary: isBlockedFromPrimary,
            isHiddenFromBlogNetwork: isHiddenFromBlogNetwork,
            isOptoutAds: isOptoutAds,
            name: name,
            paywallAccess: paywallAccess,
            posts: posts,
            shareLikes: shareLikes,
            subscribed: subscribed,
            subscriptionPlan: subscriptionPlan,
            theme: theme,
            title: title,
            url: url,
            uuid: uuid
        )
    }
}
