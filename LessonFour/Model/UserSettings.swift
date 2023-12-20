
import Foundation
import Combine

final class UserSettings: ObservableObject {
    
    @Published var isLoggedIn = false
       
    var name = ""
}
