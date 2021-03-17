//
//  ShapeSetGame.swift
//  Set Game
//
//  Created by Антон Сафронов on 09.11.2020.
//

import SwiftUI

class ShapeSetGame: ObservableObject {
    
    @Published var setGame: SetGame<Shapes> = ShapeSetGame.createSetGame()
    
    var cards: Array<SetGame<Shapes>.Card> {
        setGame.cards
    }
    
    var arrayCardsOnTable: Array<SetGame<Shapes>.Card> {
        setGame.arrayCardsOnTable
    }
    
    static func createSetGame() -> SetGame<Shapes> {
        //        array = arrayOfShapes.randomElement()
        
        SetGame<Shapes>(countOfCards: arrayOfShapes.count) { index in arrayOfShapes[index]}
    }
    
    static var arrayOfShapes: Array<Shapes> = ArrayShapes().arrayOfShapes
    
    func testingValue() -> Int {
        setGame.testValue ?? 404
    }
    
    //MARK: - intent(s)
    
    func restartGame() {
        setGame = ShapeSetGame.createSetGame()
        cardsOnTable()
    }
    
    func choose(card: SetGame<Shapes>.Card) {
        setGame.choose(card: card)
    }
    
    func cardsOnTable() {
        setGame.cardsOnTable()
    }
    
    func countOfShapes() -> String {
        String(ArrayShapes().arrayOfShapes.count)
    }
    
    func newSetCards() {
        setGame.newSetCardsAction()
    }
    
}
