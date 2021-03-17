//
//  Shapes.swift
//  Set Game
//
//  Created by Антон Сафронов on 09.11.2020.
//

import SwiftUI

struct Shapes: Shape, Matchable {
    static func match(cards: [Shapes]) -> Bool {
        let sums = [
            cards.reduce(0, { $0 + $1.fig }),
            cards.reduce(0, { $0 + $1.countOfFig }),
            cards.reduce(0, { $0 + $1.color }),
            cards.reduce(0, { $0 + $1.opacity })
        ]
        print(sums)
        return sums.reduce(true, { $0 && ($1.isMultiple(of: 3)) })
    }
    
    let startAngle: Angle = Angle.degrees(-90)
    let endAngle: Angle = Angle.degrees(-430)
    let clockwise: Bool = true
    
    //свойства для карт
    var fig: Int    //фигура: rectangle-diamond-circle 1-2-3
    var countOfFig: Int      //количество фигур на карте: 1-2-3
    var color: Int  //цвет фигур red-green-blue: 1-2-3
    var opacity: Int  //степень закрашивания 1-2-3
    
    func path(in rect: CGRect) -> Path {
        //rectangle
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let height = min(rect.width, rect.height)/2
        let lBPoint = CGPoint(x: rect.midX - height, y: rect.midY - height/2)
        let lTPoint = CGPoint(x: rect.midX - height, y: rect.midY + height/2)
        let rTPoint = CGPoint(x: rect.midX + height, y: rect.midY + height/2)
        let rBPoint = CGPoint(x: rect.midX + height, y: rect.midY - height/2)
        
        //diamond
        let topPoint = CGPoint(x: rect.midX, y: rect.midY + radius/2)
        let rightPoint = CGPoint(x: rect.midX + radius, y: rect.midY)
        let botPoint = CGPoint(x: rect.midX, y: rect.midY - radius/2)
        let leftPoint = CGPoint(x: rect.midX - radius, y: rect.midY)
        
        //circle
        let startAngle = Angle.degrees(0)
        let endAngle = Angle.degrees(360)
        
        var p = Path()
        
        switch fig {
//      rectangle
        case 1:
            p.move(to: lBPoint)
            p.addLine(to: lTPoint)
            p.addLine(to: rTPoint)
            p.addLine(to: rBPoint)
            p.addLine(to: lBPoint)
            return p
//      diamond
        case 2:
            p.move(to: center)
            p.move(to: topPoint)
            p.addLine(to: rightPoint)
            p.addLine(to: botPoint)
            p.addLine(to: leftPoint)
            p.addLine(to: topPoint)
            return p
//      circle
        case 3:
            p.addArc(center: center,
                     radius: radius,
                     startAngle: startAngle,
                     endAngle: endAngle,
                     clockwise: true)
            return p
        default:
            return p
        }
    }
}


