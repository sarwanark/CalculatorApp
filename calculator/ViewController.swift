//
//  ViewController.swift
//  Calculator

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dot: UIButton!
    
    var isFirstDigit = true
    var operation1 : Double = 0
    var operation2 = "="
    var dotCount = 2
    
    var displayValue : Double {
        
        get {
            
            return NumberFormatter().number(from: label.text!)!.doubleValue
            
        }
        set {
            
            var DisVal = ""
            let check = "0.00"
            
            DisVal = String(format: "%2.2f", newValue)
            isFirstDigit = true
            operation2 = "="
            
            if DisVal == check{
                label.text = "0"
            }else{
                label.text = DisVal
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonsPressed(_ sender: AnyObject) {
        
        let tag = sender.tag
        if tag == 17{
            if dotCount == 2{
            let dec = "."
            label.text = isFirstDigit ? String("0\(dec)") : label.text! + dec
            dotCount -= 1
            isFirstDigit = false
            }
 
        }else{
        let digit = sender.currentTitle!
        
        label.text = isFirstDigit ? digit : label.text! + digit!
        isFirstDigit = false
        }
        
    }
    
    @IBAction func clear(_ sender: Any) {
        
        displayValue = 0
        
    }
    
    @IBAction func operations(_ sender: AnyObject) {
        
        operation2 = sender.currentTitle!!
        operation1 = displayValue
        dotCount = 2
        isFirstDigit = true
        
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        
        switch operation2 {
        case "+":
            displayValue += operation1
        case "-":
            displayValue = operation1 - displayValue
        case "*":
            displayValue *= operation1
        case "/":
            displayValue = operation1 / displayValue
            
        default:
            dotCount = 2
        }
        
        
    }
    
    @IBAction func plusMinus(_ sender: Any) {
        
        if displayValue != 0{
            displayValue = displayValue * (-1)
        }else{
            displayValue = 0
        }
 
    }
    
}

