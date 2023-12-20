//
//  buttonView.swift
//  LessonFour
//
//  Created by Даниил on 18.12.2023.
//

import SwiftUI

struct ButtonView: View {
    
    @ObservedObject var timer: TimeCounter
    
    var buttonColor: Color
    
    var buttonTitle: String
    
    var action: () -> ()
    
    var body: some View {
        
        Button(action: { action() }, label: {
            Text(buttonTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .animation(.bouncy)
        })
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 4)
        )

        }
    }


