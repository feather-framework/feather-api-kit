import FeatherOpenAPIKit

extension OperationResponse {

    public static var seeOther: Self {
        .init(303, Feather.Core.Responses.SeeOther.self)
    }
}

extension Feather.Core.Responses {

    public enum SeeOther: Response {
        public static let description = "See Other"
    }
}
