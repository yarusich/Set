//
//  ArrayExtension.swift
//  Set Game
//
//  Created by Антон Сафронов on 09.11.2020.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Optional<Int> {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    var only: Element? {
        count <= 2  ? first : nil
    }
}
