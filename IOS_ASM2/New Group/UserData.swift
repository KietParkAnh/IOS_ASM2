//
//  UserData.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 05/09/2023.
//

import SwiftUI
struct User: Identifiable {
    var id = UUID()
    var username: String
    var gameLevel: String
    var score: Int
    var badges: [AchievementBadge]
    var gamesPlayed: Int
    var winPercentage: Double
}
struct AchievementBadge: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String // Image name or URL
}

struct AchievementBadgesView: View {
    var user: User

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(user.badges) { badge in
                    VStack {
                        Image(badge.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text(badge.name)
                    }
                }
            }
        }
    }
}
struct GameplayStatisticsView: View {
    var user: User

    var body: some View {
        VStack {
            Text("Games Played: \(user.gamesPlayed)")
            Text("Win Percentage: \(user.winPercentage)%")
        }
    }
}
