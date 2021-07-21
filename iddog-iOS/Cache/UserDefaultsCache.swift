import Foundation

class UserDefaultsCache: Cache {
    private let dataSource: UserDefaults
    
    init(dataSource: UserDefaults) {
        self.dataSource = dataSource
    }
    
    func add(value: Any?, forKey key: String) {
        self.dataSource.set(value, forKey: key)
        self.dataSource.synchronize()
    }
    
    func removeValue(forKey key: String) {
        self.dataSource.removeObject(forKey: key)
        self.dataSource.synchronize()
    }
    
    func value(forKey key: String) -> Any? {
        return self.dataSource.value(forKey: key)
    }
    
    func clear() {
        fatalError("to be implemented")
    }
}
