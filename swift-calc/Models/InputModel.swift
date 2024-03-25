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
    private let limitCountSymbol: Int = 9

    
    // Checking for the length of the string
    private func checkLengthString() -> String {
        var str = digits

        if str.count > limitCountSymbol {
            let range = str.index(str.startIndex, offsetBy: limitCountSymbol)..<str.endIndex
            str.removeSubrange(range)
            return str
        }
        
        return str
    }
    
    
    // Perform the operation
    private func doOperation() -> String {
        operation = .none
        digits = String(result)
        if String(result).hasSuffix(".0") {
            digits = String(Int(result))
            return checkLengthString()
        }
        return checkLengthString()
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
        guard digits.count < limitCountSymbol else { return checkLengthString() }
        
        if let number = Double(digits) {
            if String(number).hasSuffix(".0") {
                digits = String(-Int(number))
                return checkLengthString()
            }
            digits = String(-number)
            return checkLengthString()
        } else {
            return checkLengthString()
        }
    }
    
    
    // Add point
    func addPoint() -> String {
        if !comma {
            digits += "."
            comma = true
            return checkLengthString()
        }
        
        comma = true
        
        return checkLengthString()
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
        digits = "0"
    }
    
    
    // Calculations in the flow
    func equalSquence() -> String {
        guard firstOper != .percent else {
            if String(Double(digits)! / 100).hasSuffix(".0") { return String(Int(digits)! / 100) }
            return checkLengthString()
        }
        
        if operation == .percent {
            var percentNum = digits
            firstNum = result
            result = firstNum / 100 * (Double(percentNum) ?? 0)
            if String(result).hasSuffix(".0") {
                return checkLengthString()
            } else {
                return checkLengthString()
            }
        }
        
        if operation == .none {
            return checkLengthString()
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
        guard digits.count < limitCountSymbol else { return checkLengthString() }
        
        if operation != .none && resetLabel == true {
            digits = "0"
            resetLabel = false
        }
        digits += String(num)
        
        guard digits.first == "0" && !comma else { return checkLengthString() }
        digits.removeFirst()
        
        return checkLengthString()
    }
    
    
    // Clear label
    func clear() -> String {
        digits = "0"
        result = 0
        operation = .none
        comma = false
        firstNum = 0
        firstOper = .none
        return checkLengthString()
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
