//
//  ArrayShape.swift
//  Set Game
//
//  Created by Антон Сафронов on 16.11.2020.
//

import SwiftUI

//struct ArrayShapes {
//    var arrayOfShapes: Array<Shapes> = ArrayShapes.generatorShapes()
//
//    static func generatorShapes() -> Array<Shapes> {
//        var arrayOfCards: Array<Shapes> = []
//        for Fig in ["rectangle", "diamond", "circle"] {
//            for count in 1...3 {
//                for color in [Color.green, Color.red, Color.blue] {
//                    for opacity in 1...3 {
//                        arrayOfCards.append(Shapes(fig: Fig, countOfFig: count, color: color, opacity: opacity))
//                    }
//                }
//            }
//        }
//        return arrayOfCards
//    }
//}

struct ArrayShapes {
    var arrayOfShapes: Array<Shapes> = ArrayShapes.generatorShapes()
    
    static func color(_ number: Int) -> Color {
        switch number {
        case 1:
            return .red
        case 2:
            return .green
        case 3:
            return .blue
        default:
            return .black
        }
    }
    
    
    static func generatorShapes() -> Array<Shapes> {
        var arrayOfCards: Array<Shapes> = []
        for fig in 1...3 {
            for count in 1...3 {
                for color in 1...3 {
                    for opacity in 1...3 {
                        arrayOfCards.append(Shapes(fig: fig, countOfFig: count, color: color, opacity: opacity))
                    }
                }
            }
        }
        return arrayOfCards
    }
}
