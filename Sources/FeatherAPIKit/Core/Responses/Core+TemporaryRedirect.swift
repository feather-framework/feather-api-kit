import FeatherOpenAPIKit

extension OperationResponse {

    public static var temporaryRedirect: Self {
        .init(307, Feather.Core.Responses.TemporaryRedirect.self)
    }
}

extension Feather.Core.Responses {

    public enum TemporaryRedirect: Response {
        public static let description = "Temporary Redirect"
    }
}


