import FeatherOpenAPIKit

extension OperationResponse {

    public static var found: Self {
        .init(302, Feather.Core.Responses.Found.self)
    }
}

extension Feather.Core.Responses {

    public enum Found: Response {
        public static let description = "Found"
    }
}
