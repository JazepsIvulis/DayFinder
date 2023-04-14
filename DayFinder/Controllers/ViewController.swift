//
//  ViewController.swift
//  DayFinder
//
//  Created by jazeps.ivulis on 12/04/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findButtonTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let myDay = Int(dayTextField.text ?? ""), let myMonth = Int(monthTextField.text ?? ""), let myYear = Int(yearTextField.text ?? "") else {
            basicAlert(title: "Error", message: " Text fields can't be empty!")
            return
        }
        
        dateComponents.day = myDay
        dateComponents.month = myMonth
        dateComponents.year = myYear
        
        guard let myDate = calendar.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if myDay >= 1 && myDay <= 31 && myMonth >= 1 && myMonth <= 12 {
                let weekday = dateFormatter.string(for: myDate)
                resultLabel.text = weekday?.capitalized
            }else{
                basicAlert(title: "Wrong Date", message: "Please, check your date!")
                clearMyTextFields()
            }
        default:
            clearMyTextFields()
        }
    }//findButtonTapped
    
    func clearMyTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Result"
        findButton.setTitle("Find", for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let vc = segue.destination as? InfoViewController else {return}
            vc.nameText = "Jazeps"
            vc.infoText = "This is InfoViewController"
        }
    }
}
