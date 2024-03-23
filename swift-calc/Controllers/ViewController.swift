//
//  ViewController.swift
//  swift-calc
//
//  Created by Дывак Максим on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var calc = Calc()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
        
        
    }
    
    
    // MARK: Numbers
    
    @IBAction func numBtn(_ sender: UIButton) {
        resultLabel.text = calc.printNums(sender.tag)
    }
    
    
    // MARK: Comma
    
    @IBAction func commaBtn(_ sender: UIButton) {
        
    }
    
    
    // MARK: Advanced operations
    
    @IBAction func clearBtn(_ sender: UIButton) {
        resultLabel.text = calc.clear()
    }
    
    @IBAction func switchNegativeBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        
    }
    
    
    // MARK: Main operations
    
    @IBAction func divideBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        resultLabel.text = calc.operationIs(.multiply)
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        resultLabel.text = calc.operationIs(.add)
    }
    
    @IBAction func subtractBtn(_ sender: UIButton) {
        resultLabel.text = calc.operationIs(.subtract)
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        resultLabel.text = calc.equal()
    }
    
}

