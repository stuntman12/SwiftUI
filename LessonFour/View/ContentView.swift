//
//  ContentView.swift
//  LessonFour
//
//  Created by Даниил on 18.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserSettings
    @State private var back = false
    @State private var storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .animation(.easeIn)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer, buttonColor: .blue, buttonTitle: timer.buttonTitle, action: timer.startTimer)
                .padding(.bottom, 100)
            
            ButtonView(timer: TimeCounter(), buttonColor: .red, buttonTitle: "LogOut", action: { storageManager.delete()
                
            } )
        }
        .padding()
    }
}


