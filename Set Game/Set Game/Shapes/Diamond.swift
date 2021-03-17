//
//  Rhombus.swift
//  Set Game
//
//  Created by Антон Сафронов on 19.11.2020.
//

import SwiftUI

//struct Diamond: Shape {
//
//
//    func path(in rect: CGRect) -> Path {
//        let radius = min(rect.width, rect.height) / 2
//        let topPoint = CGPoint(x: rect.midX, y: rect.midY + radius/2)
//        let rightPoint = CGPoint(x: rect.midX + radius, y: rect.midY)
//        let botPoint = CGPoint(x: rect.midX, y: rect.midY - radius/2)
//        let leftPoint = CGPoint(x: rect.midX - radius, y: rect.midY)
//
//        var p = Path()
//
//
//        p.move(to: topPoint)
//        p.addLine(to: topPoint)
//        p.addLine(to: rightPoint)
//        p.addLine(to: botPoint)
//        p.addLine(to: leftPoint)
//        p.addLine(to: topPoint)
//
//
//
//        return p
//    }
//
//}
//
//
//struct Diamond_Previews: PreviewProvider {
//    static var previews: some View {
//        Diamond().stroke()
//    }
//}


struct Diamond: Shape {
    
    
    func path(in rect: CGRect) -> Path {
//
//        let height = min(rect.width, rect.height)/2
//        let lBPoint = CGPoint(x: rect.midX - height, y: rect.midY - height/2)
//        let lTPoint = CGPoint(x: rect.midX - height, y: rect.midY + height/2)
//        let rTPoint = CGPoint(x: rect.midX + height, y: rect.midY + height/2)
//        let rBPoint = CGPoint(x: rect.midX + height, y: rect.midY - height/2)
//
//        var p = Path()
//
//
//        p.move(to: lBPoint)
//        p.addLine(to: lTPoint)
//        p.addLine(to: rTPoint)
//        p.addLine(to: rBPoint)
//        p.addLine(to: lBPoint)
        
//        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let topPoint = CGPoint(x: rect.midX, y: rect.midY + radius/2)
        let rightPoint = CGPoint(x: rect.midX + radius, y: rect.midY)
        let botPoint = CGPoint(x: rect.midX, y: rect.midY - radius/2)
        let leftPoint = CGPoint(x: rect.midX - radius, y: rect.midY)
        
        var p = Path()
//            p.move(to: center)
            p.move(to: topPoint)
            p.addLine(to: rightPoint)
            p.addLine(to: botPoint)
            p.addLine(to: leftPoint)
            p.addLine(to: topPoint)
            return p
    }
    
}


struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond().stroke()
    }
}
