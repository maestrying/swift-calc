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
    case divide
    case none
}

class Calc {
    private var digits: String = "0"
    private var result: Double = 0
    private var operation: Operations = .none
    private var resetLabel: Bool = false
    private var isNegative: Bool = false
    private var comma: Bool = false

    // Negation switch
    func negative() -> String {
        if let number = Double(digits) {
            if String(number).hasSuffix(".0") {
                digits = String(-Int(number))
                return String(-Int(number))
            }
            digits = String(-number)
            return String(-number)
        } else {
            return digits
        }
    }
    
    // Add point
    func addPoint() -> String {
        if !comma {
            digits += "."
            comma = true
            return digits
        }
        
        comma = true
        
        return digits
    }

    // Perform the operation
    private func doOperation(res: Double) -> String {
        operation = .none
        digits = String(result)
        if String(result).hasSuffix(".0") {
            digits = String(Int(result))
            return String(Int(result))
        }
        return String(result)
    }
    
    // Add the numbers
    private func add() -> String {
        result += Double(digits) ?? 0
        return doOperation(res: result)
    }
    
    // Subtract the numbers
    private func subtract() -> String {
        result -= Double(digits) ?? 0
        return doOperation(res: result)
    }
    
    // Multiply the numbers
    private func multiply() -> String {
        result *= Double(digits) ?? 0
        return doOperation(res: result)
    }
    
    // Divide the numbers
    private func divide() -> String {
        if Int(digits)! != 0 {
            result /= Double(digits) ?? 0
        } else { return "Ошибка" }
        
        return doOperation(res: result)
    }
    
    // Choice operation
    func operationIs(_ oper: Operations) {
        comma = false
        resetLabel = true
        result = Double(digits) ?? 0
        
        switch oper {
        case .add: operation = .add
        case .subtract: operation = .subtract
        case .multiply: operation = .multiply
        case .divide: operation = .divide
        default: break
        }
    }
    
    func equalSquence() -> String {
        if operation == .none {
            return digits
        }
        return equal()
    }
    
    // Calculate result
    func equal() -> String {
        switch operation {
        case .add:      return add()
        case .subtract: return subtract()
        case .multiply: return multiply()
        case .divide:   return divide()
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
        
        guard digits.first == "0" && !comma else { return digits }
        digits.removeFirst()
        
        return digits
    }
    
    // Clear label
    func clear() -> String {
        digits = "0"
        result = 0
        operation = .none
        comma = false
        return digits
    }
}
