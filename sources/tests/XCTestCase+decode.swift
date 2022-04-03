import Foundation
import os
import XCTest

extension XCTestCase
{
    private var log: Logger {
        Logger(subsystem: "dev.jano", category: "tumblrnpf")
    }

    func decode<T: Decodable>(filename: String, ext: String = "json") -> T?
    {
        let bundle = Bundle.module
        let url = bundle.url(forResource: filename, withExtension: ext)
        guard let url = url, let jsonData = try? Data(contentsOf: url) else {
            XCTFail("Missing \"\(filename).\(ext)\". Bundle.module is \(bundle.bundlePath).")
            return nil
        }
        do {
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch {
            let errorMessage = "\(error)"
                .components(separatedBy: ", ")
                .joined(separator: ", \n                   ")
            log.warning("""
                Error decoding. Details follow...
                Source JSON: \(filename)
                Decoded type: \(T.self)
                Error: \(errorMessage)
                JSON contents: \n\(String(decoding: jsonData, as: UTF8.self))
                """)
            return nil
        }
    }
}

