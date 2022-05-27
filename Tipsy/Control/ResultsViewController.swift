//  Sabah Naveed
//  ResultsViewController.swift
//  Tipsy
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalSplit: String = "0.0"
    var split: Int = 0
    var tip: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = finalSplit
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
