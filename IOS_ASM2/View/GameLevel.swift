//
//  GameLevel.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 05/09/2023.
//

import SwiftUI

struct GameLevel: View {
//    @State var selectedLevel: String?
    @State var score: Int
    @Binding var selectedLevel: String?
    @State var name: String
    @EnvironmentObject var gameData: GameData // Injected GameData instance
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: EasyGame(score: $score, selectedLevel: $selectedLevel), tag: "Easy", selection: $selectedLevel) {
                    EmptyView()
                }
                Button(action: {
                    selectedLevel = "Easy"
                    let defaults = UserDefaults.standard
                    defaults.set(selectedLevel, forKey: "level")
                }) {
                    Text("Easy")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                NavigationLink(destination: NormalGame(score: $score, selectedLevel: $selectedLevel), tag: "Normal", selection: $selectedLevel) {
                    EmptyView()
                }
                Button(action: {
                    selectedLevel = "Normal"
                    let defaults = UserDefaults.standard
                    defaults.set(selectedLevel, forKey: "level")
                }) {
                    Text("Normal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }

                NavigationLink(destination: HardGame(score: $score, selectedLevel: $selectedLevel), tag: "Hard", selection: $selectedLevel) {
                    EmptyView()
                }
                Button(action: {
                    selectedLevel = "Hard"
                    let defaults = UserDefaults.standard
                    defaults.set(selectedLevel, forKey: "level")
                }) {
                    Text("Hard")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }

    }


}
struct GameLevel_Previews: PreviewProvider {
    @State static var score = 0 // Define a score binding
    @State static var selectedLevel: String? = nil // Define a selectedLevel binding (initialized as nil)
    @State static var name = "Simple" // Define and initialize the name binding

    static var previews: some View {
        NavigationView {
            GameLevel(score: score, selectedLevel: $selectedLevel, name: name)
        }
    }
}

