
import SwiftUI

struct LoginView: View {
        
    @EnvironmentObject private var user: UserSettings
    
    @State private var name = ""
    
    @State private var colorCount = Color.red
    
    @State private var storageManager = StorageManager.shared
    
    var body: some View {
        VStack(spacing: 30){
            HStack{
                Text(user.name)
                TextField("Enter Text", text: $name)
                    .frame(width: 140, height: 40)
                    .border(.black, width: 1)
                    .multilineTextAlignment(.center)
                if name.count >= 3 {
                    Text(name.count.formatted())
                    .foregroundColor(.green)
                } else {
                    Text(name.count.formatted())
                    .foregroundColor(.red)
                }
            }
            
            if name.count >= 3 {
                Button(action: { 
                    login()
                    storageManager.save(user.isLoggedIn, user.name)
                })
                    {
                    Label("OK", systemImage: "checkmark.circle")
                }
                
            } else {
                Button(action: {
                    login()
                }
                )
                {
                    Label("OK", systemImage: "checkmark.circle")
                }
                .disabled(true)
            }
        }
    }
}

extension LoginView {
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
}

