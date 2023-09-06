// LeaderboardView.swift
import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var gameData: GameData
    @Binding var selectedLevel: String?
    @Binding var score: Int
    @Binding var name: String
//    @Binding var dispLevel: String?

    var body: some View {
        VStack {
            Text("Name: \(name)")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            Text("Level: \(selectedLevel ?? "")")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
                .onAppear{
                    setLevel()
                }
            
            Text("Score: \(gameData.score)")
                .font(.headline)
                .padding()
        }
    }
    func setLevel() {
        let defaults = UserDefaults.standard
        if let level = defaults.string(forKey: "level")
        {
            
            selectedLevel = level
            print(selectedLevel)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static let gameData = GameData()

    static var previews: some View {
        LeaderboardView(selectedLevel: .constant("Easy"), score: .constant(30), name: .constant("Simple"))
            .environmentObject(gameData)
    }
}
