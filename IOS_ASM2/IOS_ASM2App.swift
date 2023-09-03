//
//  IOS_ASM2App.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 03/09/2023.
//

import SwiftUI

@main
struct IOS_ASM2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
