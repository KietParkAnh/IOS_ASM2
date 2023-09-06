//
//  IOS_ASM2App.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 03/09/2023.
//

import SwiftUI

@main
struct IOS_ASM2App: App {
    @StateObject private var gameData = GameData() // Create an instance of GameData and mark it as a StateObject

    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView() // Pass an empty array
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(gameData)    
        }
    }
}
