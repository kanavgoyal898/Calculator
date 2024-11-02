import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Invalid number: \(displayLabel.text!)")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculatorLogic = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        // collapse/expand: opt + cmd + <-/->
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        
        if let calcMethod = sender.currentTitle {
            calculatorLogic.setNumber(displayValue)
            if let result = calculatorLogic.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        // collapse/expand: opt + cmd + <-/->
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

