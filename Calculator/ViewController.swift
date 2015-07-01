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
    
    var userTypingNumber: Bool = false
    
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
}

