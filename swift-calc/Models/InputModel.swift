//
//  ValueModel.swift
//  swift-calc
//
//  Created by Дывак Максим on 20.03.2024.
//

import Foundation
import UIKit

class InputModel {
    
    
    func printNum(label: UILabel, num: Int) {
        label.text! += String(num)
    }
    
    func clear(label: UILabel) {
        label.text! = "0"
    }
    
}
