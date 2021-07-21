import Alamofire

protocol AuthenticatedRequest: Request {
    var interceptor: Interceptor { get }
}
