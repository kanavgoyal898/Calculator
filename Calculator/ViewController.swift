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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        // collapse/expand: opt + cmd + <-/->
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            switch(calcMethod) {
            case("AC"): displayValue = displayValue * 0; break;
            case("+/-"): displayValue = displayValue * -1; break;
            case("%"): displayValue = displayValue * 0.01; break;
            default: break;
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

