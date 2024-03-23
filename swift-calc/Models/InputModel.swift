//
//  ValueModel.swift
//  swift-calc
//
//  Created by Дывак Максим on 20.03.2024.
//

import Foundation
import UIKit

// Set of operations
enum Operations {
    case add
    case subtract
    case multiply
    case none
}

class Calc {
    private var digits: String = "0"
    private var result: Int = 0
    private var operation: Operations = .none
    private var resetLabel: Bool = false

    
    // Add the numbers
    private func add() -> String {
        result += Int(digits) ?? 0
        operation = .none
        digits = String(result)
        return String(result)
    }
    
    // Subtract the numbers
    private func subtract() -> String {
        result -= Int(digits) ?? 0
        operation = .none
        digits = String(result)
        return String(result)
    }
    
    // Multiply the numbers
    private func multiply() -> String {
        result *= Int(digits) ?? 0
        operation = .none
        digits = String(result)
        return String(result)
    }
    
    // Choice operation
    func operationIs(_ oper: Operations) -> String {
        resetLabel = true
        result = Int(digits) ?? 0
        
        switch oper {
        case .add: operation = .add
        case .subtract: operation = .subtract
        case .multiply: operation = .multiply
        default: break
        }
        
        return digits
    }
    
    // Calculate result
    func equal() -> String {
        switch operation {
        case .add:      return add()
        case .subtract: return subtract()
        case .multiply: return multiply()
        case .none:     return digits
        }
    }
    
    // Print nums in Label
    func printNums(_ num: Int) -> String {
        if operation != .none && resetLabel == true {
            digits = "0"
            resetLabel = false
        }
        digits += String(num)
        
        guard digits.first == "0" else { return digits }
        digits.removeFirst()
        
        return digits
    }
    
    // Clear label
    func clear() -> String {
        digits = "0"
        result = 0
        operation = .none
        return digits
    }
}
