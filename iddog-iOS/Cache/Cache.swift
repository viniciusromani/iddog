import Foundation

protocol Cache {
    func add(value: Any?, forKey key: String)
    func removeValue(forKey key: String)
    func value(forKey key: String) -> Any?
    func clear()
}
