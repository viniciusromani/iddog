import Alamofire

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

extension Request {
    var parameters: [String: Any]? {
        nil
    }

    var headers: HTTPHeaders? {
        nil
    }
}
