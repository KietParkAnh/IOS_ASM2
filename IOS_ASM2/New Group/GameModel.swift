//
//  GameModel.swift
//  IOS_ASM2
//
//  Created by Kiet Park on 04/09/2023.
//

import SwiftUI

class Card:Identifiable, ObservableObject{
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text:String
    var index:Int = 0
    enum GameLevel {
        case easy, normal, hard
    }
    init(text:String){
        self.text = text
    }
    func turnOver(){
        self.isFaceUp.toggle()
    }
}

var cardValues:[String] = [
    "🐸","🐙","🐠","🐘","🏈","🔥","🌈","🦋","👑","🎃"
]

func createCardList() -> [Card] {
    var cardList = [Card]()
    
    for cardValue in cardValues{
        cardList.append(Card(text:cardValue))
        cardList.append(Card(text:cardValue))
    }
    return cardList
}

func createMediumCardList() -> [Card] {
    var cardList = [Card]()
    let mediumCardValues = cardValues + ["🌮", "🍕"]
    
    for cardValue in mediumCardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    
    return cardList
}

func createHardCardList() -> [Card] {
    var cardList = [Card]()
    let hardCardValues = cardValues + ["🍖","🚀","🌮", "🍕"]
    
    for cardValue in hardCardValues{
        cardList.append(Card(text:cardValue))
        cardList.append(Card(text:cardValue))
    }
    return cardList
}


let faceDownCard = Card(text:"?")
