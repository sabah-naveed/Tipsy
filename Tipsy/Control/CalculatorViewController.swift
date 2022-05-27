//  Sabah Naveed
//  CalculatorViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var stepperValue = 2
    var billValue = 0.0
  
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
        splitNumberLabel.text = String(stepperValue)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        if zeroPctButton.isSelected {
            tip = 0.0
        } else if tenPctButton.isSelected {
            tip = 0.1
        } else {
            tip = 0.2
        }
        print(tip)
        print(stepperValue)
        
        if billTextField.text != "" {
            billValue = Double(billTextField.text!)!
        }
        //calculate
        billValue = (billValue + (billValue*tip)) / Double(stepperValue)
        print(String(format: "%.2f", billValue))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalSplit = String(format: "%.2f", billValue)
            destinationVC.tip = String(format: "%.0f", tip * 100)
            destinationVC.split = stepperValue
        }
    }


}

