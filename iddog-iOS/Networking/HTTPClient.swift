import Alamofire

final class HTTPClient<T: Decodable> {
    @discardableResult
    func request(_ spec: Request, onComplete: @escaping (Swift.Result<T, APIError>) -> (Void)) -> DataRequest {
        return Session.default.request(
            type(of: self).url(path: spec.path),
            method: spec.method,
            parameters: spec.parameters,
            encoding: spec.encoding,
            headers: spec.headers,
            interceptor: (spec as? AuthenticatedRequest)?.interceptor
        )
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case let .success(decoded):
                onComplete(.success(decoded))
            case let .failure(error):
                onComplete(.failure(APIError.requestFailed(error)))
            }
        }
    }

    private static func url(path: String) -> URLConvertible {
        return "https://iddog-nrizncxqba-uc.a.run.app/\(path)"
    }
}
