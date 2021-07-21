import Alamofire

struct SignUpRequest: Request {
    struct Params {
        let email: String
    }
    
    private let params: Params
    
    init(params: Params) {
        self.params = params
    }
    
    var path: String {
        "signup"
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var encoding: ParameterEncoding {
        JSONEncoding()
    }
    
    var parameters: [String : Any]? {
        return ["email": self.params.email]
    }
}
