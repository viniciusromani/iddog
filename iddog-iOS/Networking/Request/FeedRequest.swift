import Alamofire

struct FeedRequest: AuthenticatedRequest {
    var interceptor: Interceptor {
        let dataSource = UserDefaultsCache(dataSource: UserDefaults.standard)
        let userCache = UserCache(cache: dataSource)
        return Interceptor(userCache: userCache)
    }
    
    struct Params {
        let dog: Dog
    }
    private let params: Params
    
    init(params: Params) {
        self.params = params
    }
    
    var path: String {
        "feed"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var encoding: ParameterEncoding {
        URLEncoding()
    }
    
    var parameters: [String : Any]? {
        return ["category": self.params.dog.apiValue]
    }

    // Como adicionar um header "Authorization" a esta Request?
    // Opcional: como adicionar um parâmetro "category" que só aceite os valores "hound", "pug" ou "husky" a esta Request?
}
