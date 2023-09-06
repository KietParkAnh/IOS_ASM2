//
//  Tutorial.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 05/09/2023.
//

import SwiftUI

struct Tutorial: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Welcome to Matching Cards Game")
                    .font(.headline)
                    .padding()
                
                Text("""
                     In a single-player Memory matching game, the objective is to match pairs of cards with identical symbols. Here's a rule list for such a game:

                     Setup: Place a deck of shuffled cards face down on a playing surface. Each card has a symbol on its face.
                     Game Start: The player starts with a score of 0. They choose any two face-down cards to reveal. If the symbols match, the cards are removed from play, and the player earns points.
                     Matching: To make a match, both cards must display the same symbol. If the symbols don't match, the cards are turned face down again.
                     Scoring: The player earns points for every successful match. The game can be timed, and bonus points may be awarded for completing the game quickly.
                     Game Over: The game ends when all pairs are matched, or a timer runs out. The player's score is recorded.
                     Winning: The player's performance is rated based on their score and time taken. They can aim to beat their own records or challenge others.
                     Challenge Levels: Difficulty can be adjusted by changing the number of cards in the deck or the complexity of the symbols.
                     Strategy: Memory and strategy are crucial for success. Players must remember the locations of face-down cards to make matches efficiently.
                     Replayability: The game can be replayed to improve memory skills and achieve higher scores.
        """)
                .frame(width: 350)
            }
        }
        
        
    }
}

struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}
