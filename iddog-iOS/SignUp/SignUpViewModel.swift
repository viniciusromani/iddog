import Foundation

class SignUpViewModel {
    weak var view: SignUpViewProtocol?
    private let cache: UserCache
    
    init(cache: UserCache) {
        self.cache = cache
    }
    
    func login(email: String?) {
        guard let unwrapped = email else {
            self.view?.errorLoggingIn()
            return
        }
        
        let params = SignUpRequest.Params(email: unwrapped)
        let request = SignUpRequest(params: params)
        _ = HTTPClient<SingUpResponse>().request(request, onComplete: { [weak self] result in
            switch result {
            case .success(let response):
                self?.cache.save(user: response.user)
                self?.view?.didLogIn()
            case .failure:
                self?.view?.errorLoggingIn()
            }
        })
    }
}
