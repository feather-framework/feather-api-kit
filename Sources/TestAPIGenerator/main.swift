import FeatherAPIKit
import Foundation
import Yams

let document = OpenAPIDocument()
let encoder = YAMLEncoder()

do {
    let openAPIDocument = try document.openAPIDocument()
    _ = try openAPIDocument.locallyDereferenced()

    let yaml = try encoder.encode(openAPIDocument)
    let basePath = #file
        .split(separator: "/")
        .dropLast(3)
        .joined(separator: "/")

    let paths = [
        "/\(basePath)/openapi/openapi.yaml"
    ]

    for path in paths {
        try yaml.write(
            to: URL(fileURLWithPath: path),
            atomically: true,
            encoding: .utf8
        )
    }
}
catch {
    fatalError("\(error)")
}
