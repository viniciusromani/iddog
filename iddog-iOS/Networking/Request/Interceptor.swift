import Foundation
import Alamofire

class Interceptor: RequestInterceptor {
    private let userCache: UserCache
    
    init(userCache: UserCache) {
        self.userCache = userCache
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if let token = self.userCache.get()?.token {
            urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
    }
}
