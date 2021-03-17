//
//  Set_GameApp.swift
//  Set Game
//
//  Created by Антон Сафронов on 09.11.2020.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            ShapeSetGameView(shapeSetGame: ShapeSetGame())
        }
    }
}

protocol Matchable {
    static func match(cards: [Self]) -> Bool
}

struct SetGame <CardContent> where CardContent: Matchable {
    
    //первоначальный массив (81)
    var cards: Array<Card>
    //массив на столе (<=12)
    var arrayCardsOnTable: Array<Card> = []
    
    var testValue: Int? = 1111
    
    
    var countCardsTrue: Bool {
        mutating get {
            var selectedCardIndices: Array<Int> = []
            for index in cards.indices {
                if cards[index].isSelected {
                    selectedCardIndices.append(index)
                }
            }
            if selectedCardIndices.count <= 2 {
                return true
            } else {
                isMatch()
                return false
                
            }
        }
    }
    var selectedIndieces: [Int] { cards.indices.filter { cards[$0].isSelected}}
    
    mutating func isMatch() {
//        var arrayIsMatched = Array<Card>()
//        for index in cards.indices {
//            if cards[index].isSelected {
//                arrayIsMatched.append(cards[index])
//            }
//        }
        
        if CardContent.match(cards: selectedIndieces.map { cards[$0].content }) {
            for index in cards.indices {
                if cards[index].isSelected {
                    cards[index].isMatched = true
                }
            }
        }
    }
    
    mutating func cardsOnTable() {
        arrayCardsOnTable.removeAll()
        for index in cards.indices {
            if arrayCardsOnTable.count < 12,
               cards[index].inGame,
               cards[index].onTable {
                arrayCardsOnTable.append(cards[index])
            }
        }
    }
    
    
    mutating func choose(card: Card) {
       
        if let chosenIndex = cards.firstIndex(matching: card),
           countCardsTrue {
            cards[chosenIndex].isSelected = !cards[chosenIndex].isSelected
        } else if let chosenIndex = cards.firstIndex(matching: card) {
            for index in cards.indices {
                if cards[index].isSelected,
                   cards[index].isMatched {
                    cards[index].inGame = false
                    moreCards()
                    
                }
                cards[index].isSelected = false
            }
            cards[chosenIndex].isSelected = !cards[chosenIndex].isSelected
        }
        cardsOnTable()
    }
    
    mutating func newSetCardsAction() {
        var countInGame = 0
        for index in cards.indices {
            if cards[index].inGame {
                countInGame += 1
            }
        }
        guard countInGame > 13 else {
            return
        }
        var count: Int = 0
        for index in cards.indices {
            if cards[index].isSelected {
                count += 1
            }
        }
        if count == 3 {
            moreCards()
            for index in cards.indices {
                if cards[index].isSelected {
                    cards[index].isSelected = false
                    cards[index].onTable = false
                    cards[index].inGame = true
                }
            }
        }
        
        cardsOnTable()
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func moreCards() {
        var counter = 0
        for index in cards.indices {
            if  counter < 3,
                cards[index].inGame,
                !cards[index].onTable {
                cards[index].onTable = true
                counter += 1
            }
        }
    }
    

    
    init(countOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<countOfCards {
            let content: CardContent = cardContent(index)
            cards.append(Card(content: content, id: index))
        }
        var countOnTable = 0
        for index in cards.indices {
            if countOnTable < 12 {
                cards[index].onTable = true
                countOnTable += 1
            }
        }
        cardsOnTable()
        //        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isMatched: Bool = false
        var isSelected: Bool = false
        var content: CardContent
        var id: Int
        var onTable:Bool = false
        var inGame: Bool = true
        var theme: Int = 1
    }
}


