//
//  GameData.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 06/09/2023.
//

import SwiftUI

class GameData: ObservableObject {
    @Published var score: Int = 0
    @Published var selectedLevel: String = "" // You can set the default value here
    @Published var name: String = "Simple"
    
    
//    func setSelectLevel(level: String) {
//        var difficulty = level
//        if let encodeLevel  = try? JSONEncoder().encode(difficulty) {
//            UserDefaults.standard.set(difficulty, forKey: "level")
//        }
//            
//    }
}
