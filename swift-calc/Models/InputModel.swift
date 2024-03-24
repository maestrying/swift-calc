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
    case percent
    case none
}


class Calc {
    private var digits: String = "0"
    private var result: Double = 0
    private var operation: Operations = .none
    private var resetLabel: Bool = false
    private var isNegative: Bool = false
    private var comma: Bool = false
    private var firstNum: Double = 0
    private var firstOper: Operations = .none

    
    // Perform the operation
    private func doOperation() -> String {
        operation = .none
        digits = String(result)
        if String(result).hasSuffix(".0") {
            digits = String(Int(result))
            return String(Int(result))
        }
        return String(result)
    }
    
    
    // Percent
    private func percent() -> String {
        switch firstOper {
        case .add: result = firstNum + result
        case .subtract: result = firstNum - result
        case .multiply: result = firstNum * result / 100
        case .divide: result = firstNum / result
        case .percent: break
        case .none: result = firstNum / 100
        }
        
        return doOperation()
    }
    
    
    // Add the numbers
    private func add() -> String {
        result += Double(digits) ?? 0
        return doOperation()
    }
    
    
    // Subtract the numbers
    private func subtract() -> String {
        result -= Double(digits) ?? 0
        return doOperation()
    }
    
    
    // Multiply the numbers
    private func multiply() -> String {
        result *= Double(digits) ?? 0
        return doOperation()
    }
    
    
    // Divide the numbers
    private func divide() -> String {
        if (Int(digits) ?? 0) != 0 {
            result /= Double(digits) ?? 0
        } else { return "Ошибка" }
        
        return doOperation()
    }
    
    
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
    
    
    // Choice operation
    func operationIs(_ oper: Operations) {
        if operation == .none { firstOper = oper }
        
        switch oper {
        case .add: operation = .add
        case .subtract: operation = .subtract
        case .multiply: operation = .multiply
        case .divide: operation = .divide
        case .percent: operation = .percent
        default: break
        }
        
        guard operation != .percent else { return }
        comma = false
        resetLabel = true
        result = Double(digits) ?? 0
    }
    
    
    // Calculations in the flow
    func equalSquence() -> String {
        guard firstOper != .percent else {
            if String(Double(digits)! / 100).hasSuffix(".0") { return String(Int(digits)! / 100) }
            return String(Double(digits)! / 100)
        }
        if operation == .percent {
            var percentNum = digits
            firstNum = result
            result = firstNum / 100 * (Double(percentNum) ?? 0)
            if String(result).hasSuffix(".0") {
                return String(Int(result))
            } else {
                return String(result)
            }
        }
        
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
        case .percent:  return percent()
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
        firstNum = 0
        firstOper = .none
        return digits
    }
    
    
    // Delete last symbol
    func clearLastSymb() -> String {
        guard digits.count > 1 else {
            digits = "0"
            return "0"
        }
        
        var mutableLabel = digits
        mutableLabel.removeLast()
        
        digits = mutableLabel
        return mutableLabel
    }
    
}
