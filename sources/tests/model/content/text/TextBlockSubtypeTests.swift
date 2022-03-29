@testable import TumblrNPF
import XCTest

final class TextBlockSubtypeTests: XCTestCase
{
    private let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    private let decoder = JSONDecoder()

    // TextBlockSubtype.unknown should encode into `"unknown"` (including quotes).
    func testEncodeUnknown() throws {
        let unknownData = try! encoder.encode(TextBlockSubtype.unknown)
        let unknownString = String(data: unknownData, encoding: .utf8)!
        XCTAssertEqual(unknownString, "\"unknown\"")
    }

    // `"unknown"` (including quotes) decode as `TextBlockSubtype.unknown`.
    func testDecodeUnknown() throws {
        let unknownData = "\"unknown\"".data(using: .utf8)!
        let unknown = try! decoder.decode(TextBlockSubtype.self, from: unknownData)
        XCTAssertEqual(unknown, TextBlockSubtype.unknown)
    }

    // A random value should decode as `TextBlockSubtype.unknown`.
    func testDecodeRandomValueAsUnknown() throws {
        let randomValueData = "\"deadbeef\"".data(using: .utf8)!
        let randomValue = try! decoder.decode(TextBlockSubtype.self, from: randomValueData)
        XCTAssertEqual(randomValue, TextBlockSubtype.unknown)
    }
}
