//
//  PropertysOfShape.swift
//  Set Game
//
//  Created by Антон Сафронов on 25.01.2021.
//

import Foundation

struct SetGameCard {
    var count: Varible  //количество фигур на карте: 1-2-3
    var fig: Varible    //фигура: 1-2-3, rectangle-diamond-circle
    var color: Varible  //цвет фигур: 1-2-3, red-green-blue
    var fill: Varible   //степень закрашивания: 1-2-3
    
    enum Varible: Int {
        case v1 = 1
        case v2
        case v3
    }
    
}
//CaseIterable - для получения коллекции со всеми case

//enum PropertysOfShape: Int, CaseIterable, CustomStringConvertible {
//    case value1 = 1
//    case value1 = 2
//    case value1 = 3
//
//    var description: String { return String(self.rawValue) }
//}

