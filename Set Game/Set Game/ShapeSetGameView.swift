//
//  ContentView.swift
//  Set Game
//
//  Created by Антон Сафронов on 09.11.2020.
//

import SwiftUI

struct ShapeSetGameView: View {
    
    @ObservedObject var shapeSetGame: ShapeSetGame
    
    var body: some View {
        VStack {
            //реагирует только при нажатии на контент, а не карту! Починить
            Grid(shapeSetGame.arrayCardsOnTable) { card in
                CardContent(card: card)
                    .onTapGesture {
                    shapeSetGame.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            HStack {
                Button(action: {
                    shapeSetGame.cardsOnTable()
                }, label: {
                    Text("resume")                        
                })
                Text(String(shapeSetGame.testingValue()))
                Button(action: {
                    shapeSetGame.restartGame()
                }, label: {
                    Text("Restart")
                })
                Text(shapeSetGame.countOfShapes())
                Button(action: {
                    shapeSetGame.newSetCards()
                }, label: {
                    Text("NewSet")
                })
            }
        }
    }
}

struct CardContent: View {
    
    var card: SetGame<Shapes>.Card
    let ArrayOfColors: Array<Color> = [.red, .green, .blue]
    
    var body: some View {
        
        ZStack {
            VStack{
                ForEach(0..<card.content.countOfFig) { index in
                    newOpacity(card: card.content).foregroundColor(ArrayOfColors[selectColor(card: card.content)])
                }
            }
            .padding(8)
            if card.isSelected {
                RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5)
            } else {
                RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 5)
            }
        }
//        .foregroundColor(.orange)
        
        
    }
    
    private func selectColor(card: Shapes) -> Int{
        switch card.color {
        case 1: return 0
        case 2: return 1
        case 3: return 2
        default: return 0
        }
    }
    
    private func newOpacity(card: Shapes) -> some View {
        ZStack {
            switch card.opacity {
            case 1:
                card.stroke(lineWidth: 3.5)
            case 2:
                card.fill().opacity(0.35)
            case 3:
                card.fill()
            default:
                card.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeSetGameView(shapeSetGame: ShapeSetGame())
    }
}
