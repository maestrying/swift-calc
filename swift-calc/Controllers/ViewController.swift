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
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(deleteLastSymbol(sender:)))
        
        swipeGesture.direction = .left
        
        resultLabel.isUserInteractionEnabled = true
        resultLabel.addGestureRecognizer(swipeGesture)
        
    }
    
    @objc func deleteLastSymbol(sender: UISwipeGestureRecognizer) {
        resultLabel.text = calc.clearLastSymb()
    }
    
    
    // MARK: Numbers
    
    @IBAction func numBtn(_ sender: UIButton) {
        resultLabel.text = calc.printNums(sender.tag)
    }
    
    
    // MARK: Comma
    
    @IBAction func pointBtn(_ sender: UIButton) {
        resultLabel.text = calc.addPoint()
    }
    
    
    // MARK: Advanced operations
    
    @IBAction func clearBtn(_ sender: UIButton) {
        resultLabel.text = calc.clear()
    }
    
    @IBAction func switchNegativeBtn(_ sender: UIButton) {
        resultLabel.text = calc.negative()
        
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        calc.operationIs(.percent)
        resultLabel.text = calc.equalSquence()
    }
    
    
    // MARK: Main operations
    
    @IBAction func divideBtn(_ sender: UIButton) {
        resultLabel.text = calc.equalSquence()
        calc.operationIs(.divide)
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        resultLabel.text = calc.equalSquence()
        calc.operationIs(.multiply)
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        resultLabel.text = calc.equalSquence()
        calc.operationIs(.add)
    }
    
    @IBAction func subtractBtn(_ sender: UIButton) {
        resultLabel.text = calc.equalSquence()
        calc.operationIs(.subtract)
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        resultLabel.text = calc.equal()
    }
    
}

