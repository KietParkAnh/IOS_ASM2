//
//  EndGame.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 04/09/2023.
//

import SwiftUI

struct EndGame: View {
    var body: some View {
        Text("Congratulation, You've Won!")
        Text("Your Score: ")
        Text("Click here to restart the game")
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame()
    }
}
