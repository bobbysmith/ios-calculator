//
//  ViewController.swift
//  Calculator
//
//  Created by Bobby Smith on 6/30/15.
//  Copyright (c) 2015 Bobby Smith. All rights reserved.
//

// imports th UIKit
import UIKit

// class NameOfClass: inheritance(superclass) can only inherit from 1 class in swift
class ViewController: UIViewController {
    // outlet creates a property(instance variable)
    // var display is a property(instance variable) that points to the object that it is connected to -- var name: Type!
    @IBOutlet weak var display: UILabel!
    
    //dont need to infer type because it is obvious with bool
    var userTypingNumber = false
    

    // action create a method
    // func name(argName: argType)
    @IBAction func appendDigit(sender: UIButton) {
        //local variable of digit pressed
        // ! unwraps? the optional
        let digit = sender.currentTitle!
        // have to unwrap because optional cannot be added to string
        if userTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userTypingNumber = true
        }
        println("digit = \(digit)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userTypingNumber {
            enter()
        }
        switch operation {
            // $0 and $1 etc are swifts default naming if names arent given
            case "×": performOperation({$0 * $1})
            case "÷": performOperation({$1 / $0})
            case "+": performOperation({$0 + $1})
            case "−": performOperation({$1 - $0})
            case "√": squareRoot({sqrt($0)})
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func squareRoot(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    
    // array for number stack to be calculated, initaized to empty array
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userTypingNumber = false
        operandStack.append(displayValue)
        println("Stack is \(operandStack)")
    }
    
    // convert display text to double
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    
}

