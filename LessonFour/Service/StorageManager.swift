
import Foundation

final class StorageManager: ObservableObject {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    
    private let isLoggedInKey = "isLoggedIn"
    private let nameKey = "name"
    
    private init() {}
    
    func save(_ bool: Bool, _ string: String) {
        userDefaults.set(bool, forKey: "isLoggedIn")
        userDefaults.set(string, forKey: "name")
    }
    
    func fetchBool() -> Bool {
        if let isLoggedInKey = userDefaults.value(forKey: isLoggedInKey) as? Bool {
            return isLoggedInKey
        }
        return false
    }
    
    func fetchString() -> String {
        if let nameKey = userDefaults.value(forKey: nameKey) as? String {
            return nameKey
        }
        return ""
    }
    
    func delete() {
        userDefaults.removeObject(forKey: isLoggedInKey)
        userDefaults.removeObject(forKey: nameKey)
    }
}
