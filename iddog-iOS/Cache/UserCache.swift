import Foundation

class UserCache {
    private let cache: Cache
    private let kUser = "kUser"
    
    init(cache: Cache) {
        self.cache = cache
    }
    
    func save(user: User) {
        let encoded = try? JSONEncoder().encode(user)
        self.cache.add(value: encoded, forKey: self.kUser)
    }
    
    func get() -> User? {
        guard let data = self.cache.value(forKey: self.kUser) as? Data,
              let decoded = try? JSONDecoder().decode(User.self, from: data) else {
            return nil
        }
        return decoded
    }
}
