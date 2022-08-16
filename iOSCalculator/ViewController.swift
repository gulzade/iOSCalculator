//
//  ViewController.swift
//  iOSCalculator
//
//  Created by Gülzade Karataş on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: String = ""
    var operation: String = ""
    var secondNumber:String = ""
    var haveResult:Bool = false
    var resultNumber: String = ""
    var numberAfterResult: String = ""
    
    @IBOutlet weak var numScreen: UILabel!
    
    @IBOutlet var calculaterButtons: [UIButton]!
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
        
    }
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperation())
       
        let numArray = resultNumber.components(separatedBy: ".")
        print(numArray)
        if numArray[1] == "0" {
            numScreen.text = numArray[0]
        }else{
            numScreen.text = resultNumber
        }
        
       // numScreen.text = resultNumber
        numberAfterResult = ""
    }
    
    @IBAction func numPressed(_ sender: UIButton) { // "" + "2" = "2"
        if operation == "" {
            firstNumber += String(sender.tag)
            numScreen.text = firstNumber
        }
        else if operation != "" && !haveResult {
            secondNumber += String(sender.tag)
            numScreen.text = secondNumber
        }
        else if operation != "" && haveResult {
            numberAfterResult = String(sender.tag)
            numScreen.text = numberAfterResult
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        firstNumber  = ""
        operation  = ""
        secondNumber = ""
        haveResult = false
        resultNumber = ""
        numberAfterResult = ""
        numScreen.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculaterButtons{
            button.layer.cornerRadius = button.frame.size.height/2
            button.titleLabel?.font = UIFont(name: "System", size: 24)
            
        }
    }
    func doOperation() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! + Double(secondNumber)!
            }
            else{
                return Double(resultNumber)! + Double(numberAfterResult)!
            }
        }
        else if operation == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! - Double(secondNumber)!
            }
            else{
                return Double(resultNumber)! - Double(numberAfterResult)!
            }
        }
        else if operation == "x" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! * Double(secondNumber)!
            }
            else{
                return Double(resultNumber)! * Double(numberAfterResult)!
            }
        }
        else if operation == "/" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! / Double(secondNumber)!
            }
            else{
                return Double(resultNumber)! / Double(numberAfterResult)!
            }
        }
        return 0
    }
}

