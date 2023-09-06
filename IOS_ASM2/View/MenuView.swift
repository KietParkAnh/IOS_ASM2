// MenuView.swift
import SwiftUI

struct MenuView: View {
    @Binding var name: String
    @State private var selectedLevel: String? = nil
    @State private var score = 0 // Declare userScore as a state property

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome: \(name)")  // Display the current username
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center) // Align to the top right
                    .padding(.trailing, 20)

                NavigationLink(destination: GameLevel(score: score, selectedLevel: $selectedLevel, name: name)) {
                    Text("Let's Play")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                NavigationLink(destination: LeaderboardView(selectedLevel: $selectedLevel, score: $score, name:$name)) {
                    Text("Leaderboard")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }

                NavigationLink(destination: Tutorial()) {
                    Text("How to play")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(name: .constant("SampleUsername")) // Provide a sample username
    }
}
