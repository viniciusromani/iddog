import Foundation
import Alamofire

class FeedViewModel {
    weak var view: FeedViewProtocol?
    private let cache: UserCache
    private var sortedDog: Dog?
    
    init(cache: UserCache) {
        self.cache = cache
    }
    
    func sortDog() {
        guard let sorted = Dog.all().randomElement(),
              self.sortedDog != sorted else {
            let message = "Você acabou de sortear o mesmo cachorro, por isso não vamos recuperar as imagens tá? :)"
            self.view?.sortedDogIsSame(message)
            return
        }
        
        self.sortedDog = sorted
        self.view?.dogSorted(sorted)
    }
    
    func retrieveImages(for dog: Dog) {
        let params = FeedRequest.Params(dog: dog)
        let request = FeedRequest(params: params)
        _ = HTTPClient<FeedResponse>().request(request, onComplete: { [weak self] result in
            switch result {
            case .success(let response):
                guard let unwrapped = self?.sortedDog else { return }
                let urls = response.images.compactMap { URL(string: $0) }
                self?.view?.set(dog: unwrapped)
                self?.view?.imagesFetched(urls)
            case .failure:
                let message = "Oops! Não conseguimos recuperar as imagens do cachorro sorteado. Verifique sua conexão com a internet e tente novamente :)"
                self?.view?.errorFetchingImages(message)
            }
        })
    }
}
