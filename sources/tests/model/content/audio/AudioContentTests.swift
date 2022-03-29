@testable import TumblrNPF
import XCTest

final class AudioContentTests: XCTestCase
{
    func testAudioContent() throws {
        guard let _: AudioContent = decode(filename: "AudioContent") else {
            XCTFail("Decoding failed for AudioContent.json")
            return
        }
    }
    func testAudioContentSoundcloud() throws {
        guard let _: AudioContent = decode(filename: "AudioContentSoundcloud") else {
            XCTFail("Decoding failed for AudioContent.json")
            return
        }
    }
}
