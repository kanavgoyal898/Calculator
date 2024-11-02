import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let number = number {
            switch(symbol) {
            case("AC"): return 0
            case("+/-"): return -number
            case("%"): return number/100
            case("="): return performTwoNumberCalculation(n2: number)
            default: self.intermediateCalculation = (n1: number, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let calcMethod = intermediateCalculation?.calcMethod {
            switch(calcMethod) {
            case("+"): return n1 + n2
            case("-"): return n1 - n2
            case("×"): return n1 * n2
            case("÷"): return n1 / n2
            default : fatalError("Unknown Operation: \(calcMethod)")
            }
        }
        return nil
    }
}
