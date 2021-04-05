//
//  FirstUseViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit

class FirstUseViewController: UIViewController {
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        switch UserDefaults.standard.string(forKey: "bloodType") {
        case "AB+":
            currentBloodChoice = "AB+"
            button1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button1.layer.cornerRadius = button1.frame.height / 5
            button1.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "AB-":
            currentBloodChoice = "AB-"
            button2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button2.layer.cornerRadius = button2.frame.height / 5
            button2.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "A+":
            currentBloodChoice = "A+"
            button3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button3.layer.cornerRadius = button3.frame.height / 5
            button3.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "A-":
            currentBloodChoice = "A-"
            button4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button4.layer.cornerRadius = button4.frame.height / 5
            button4.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "B+":
            currentBloodChoice = "B+"
            button5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button5.layer.cornerRadius = button5.frame.height / 5
            button5.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "B-":
            currentBloodChoice = "B-"
            button6.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button6.layer.cornerRadius = button6.frame.height / 5
            button6.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "O+":
            currentBloodChoice = "O+"
            button7.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button7.layer.cornerRadius = button7.frame.height / 5
            button7.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        case "O-":
            currentBloodChoice = "O-"
            button8.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button8.layer.cornerRadius = button8.frame.height / 5
            button8.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)
        default:
            print("her")
        }

        
        doneButton.layer.cornerRadius = doneButton.frame.height / 7
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        button1.backgroundColor = nil
        button2.backgroundColor = nil
        button3.backgroundColor = nil
        button4.backgroundColor = nil
        button5.backgroundColor = nil
        button6.backgroundColor = nil
        button7.backgroundColor = nil
        button8.backgroundColor = nil
        button1.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button2.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button3.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button4.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button5.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button6.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button7.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button8.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        currentBloodChoice = sender.currentTitle!
        
        sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sender.layer.cornerRadius = sender.frame.height / 5
        sender.setTitleColor(#colorLiteral(red: 0.4693080783, green: 0.04539940506, blue: 0, alpha: 1), for: .normal)

    }
    
    var currentBloodChoice: String = "non"

    
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func doneButtonPressed(_ sender: Any) {
        if currentBloodChoice == "non" {
            
            errorLabel.isHidden = false
            
        }
        else{
            UserDefaults.standard.setValue(currentBloodChoice, forKey: "bloodType")
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirst" {
            
            let destinationVC = segue.destination as! ViewController
            destinationVC.doIt = true
            
            
        }
    }
    
}
