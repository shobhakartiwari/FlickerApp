//
//  SplashView.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: SystemImages.starFill.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(TextPhrases.welcomeMessage.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 3.0)){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
