import SwiftUI

struct EasyGame: View {
    public var fiveColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]

    @State private var cards = createCardList().shuffled()
    @State private var MatchedCards = [Card]()
    @State private var UserChoices = [Card]()
    @State private var gameTimeRemaining = 180 // 3 minutes
    
    @State var name:String = ""
    @Binding var score: Int// Initialize the score
    @Binding var selectedLevel: String?

    @State private var timer: Timer?
    @State private var allCardsMatched = false // Track if all cards are matched
    @EnvironmentObject var gameData: GameData // Injected GameData instance
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Text("🎃Game On🎃")
                        .font(.largeTitle)
                    HStack {
                        Text("Time Left: \(formatTime())")
                            .font(.headline)
                            .padding(.trailing, 20)
                        Text("Score: \(gameData.score)")
                            .font(.headline)
                            .padding(.leading, 20)
                    }
                    LazyVGrid(columns: fiveColumnGrid, spacing: 10) {
                        ForEach(cards) { card in
                            GameView(card: card,
                                     width: Int(geo.size.width / 4 - 10),
                                     MatchedCards: $MatchedCards,
                                     UserChoices: $UserChoices,
                                     score: $gameData.score,
                                     selectedLevel: $gameData.selectedLevel)
                        }
                    }
                }
                .onAppear {
                    startTimer()
                    resetScore()
                }
                .onDisappear {
                    stopTimer()
                }
                NavigationLink(destination: LeaderboardView(selectedLevel: $selectedLevel, score: $score, name: $name)) {
                    EmptyView()
                }
            }
        }
    }

    func formatTime() -> String {
        let minutes = gameTimeRemaining / 60
        let seconds = gameTimeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if gameTimeRemaining > 0 {
                gameTimeRemaining -= 1
            } else {
                stopTimer()
                // Handle game over when time runs out
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    func checkAllCardsMatched() {
            if MatchedCards.count == cards.count {
                allCardsMatched = true
            }
    }
    func resetScore(){
        gameData.score = 0
    }
}
struct EasyGame_Previews: PreviewProvider {
    @State static var selectedLevel: String? = "Easy" // Provide a default level for preview

    static var previews: some View {
        EasyGame(score: .constant(5), selectedLevel: $selectedLevel)
            .environmentObject(GameData())
    }
}
