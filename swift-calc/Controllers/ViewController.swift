//
//  ViewController.swift
//  swift-calc
//
//  Created by Дывак Максим on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var inputModel = InputModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: Numbers
    
    @IBAction func numBtn(_ sender: UIButton) {
        inputModel.appendDigit(sender.tag)
        resultLabel.text = inputModel.printDigits()
    }
    
    
    // MARK: Comma
    
    @IBAction func commaBtn(_ sender: UIButton) {
        
    }
    
    
    // MARK: Advanced operations
    
    @IBAction func clearBtn(_ sender: UIButton) {
        inputModel.clear()
        resultLabel.text = "0"
    }
    
    @IBAction func switchNegativeBtn(_ sender: UIButton) {
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
    }
    
    
    // MARK: Main operations
    
    @IBAction func divideBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func subtractBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
    }
    
}

