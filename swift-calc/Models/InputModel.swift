//
//  ValueModel.swift
//  swift-calc
//
//  Created by Дывак Максим on 20.03.2024.
//

import Foundation
import UIKit

class InputModel {
    private var digits: [Int] = []

    func appendDigit(_ digit: Int) {
        digits.append(digit)
    }

    func printDigits() -> String {
        guard digits.count > 1 || digits.first != 0 else {
            clear()
            return "0"
        }
        return digits.drop(while: { $0 == 0 }).map(String.init).joined()
    }
    
    func clear() {
        digits.removeAll()
    }
    
}
