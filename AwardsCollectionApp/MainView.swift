//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
    @State private var rotationAngle: Double = -10
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                Text(awardIsShowing ? "Hide Award" : "Show Award")
                Spacer()
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                    .scaleEffect(awardIsShowing ? 2 : 1)
            }
            
            Spacer()
            
            if awardIsShowing {
                ShipView()
                    .frame(width: 250, height: 250)
                    .rotationEffect(Angle(degrees: rotationAngle))
                    .animation(.easeInOut(duration: 1).repeatForever(), value: rotationAngle)
                    .onAppear {
                        rotationAngle = 10
                    }
                    .onDisappear {
                        rotationAngle = -10
                    }
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
