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
    case none
}

class Calc {
    private var digits: String = "0"
    private var result: Int = 0
    private var operation: Operations = .none
    
    private func printResoult() -> String {
        return digits
    }
    
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
    
    // Choice operation
    func operationIs(_ oper: Operations) {
        result = Int(digits) ?? 0
        digits = "0"
        
        switch oper {
        case .add: operation = .add
        case .subtract: operation = .subtract
        default: break
        }
    }
    
    // Calculate result
    func equal() -> String {
        switch operation {
        case .add:      return add()
        case .subtract: return subtract()
        case .none:     return printResoult()
        }
    }
    
    // Print nums in Label
    func printNums(_ num: Int) -> String {
        digits += String(num)
        
        guard digits.first == "0" else { return printResoult() }
        digits.removeFirst()
        
        return printResoult()
    }
    
    // Clear label
    func clear() -> String {
        digits = "0"
        result = 0
        operation = .none
        return digits
    }
}
