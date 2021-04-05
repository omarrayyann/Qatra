//
//  NewViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var wholeLayerView: UIView!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var hospitalLabel: UITextField!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSubmit.layer.cornerRadius = buttonSubmit.frame.height / 5
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [self] timer in
            if UserDefaults.standard.string(forKey: "myRequest") != nil {
                self.wholeLayerView.isHidden = false
                firstNameLabel.text = ""
                lastNameLabel.text = ""
                phoneNumberLabel.text = ""
                hospitalLabel.text = ""
                cityLabel.text = ""
            }
            else{
                
                self.wholeLayerView.isHidden = true

                
                

            }
        }
        
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
    
    var currentBloodChoice:String = "non"
    
    @IBAction func continuePressed(_ sender: Any) {
        
        if firstNameLabel.text?.isEmpty == false && lastNameLabel.text?.isEmpty == false && phoneNumberLabel.text?.isEmpty == false && cityLabel.text?.isEmpty == false && hospitalLabel.text?.isEmpty == false && currentBloodChoice != "non" && phoneNumberLabel.text!.count == 10
        {
            
            performSegue(withIdentifier: "toFinal", sender: self)
            // success and continue
            
        }
        
        else{
            
            
            if firstNameLabel.text?.isEmpty == true
            {
                errorLabel.text = "Enter your first name"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if lastNameLabel.text?.isEmpty == true
            {
                errorLabel.text = "Enter your last name"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if phoneNumberLabel.text?.isEmpty == true
            {
                errorLabel.text = "Enter your phone number"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if cityLabel.text?.isEmpty == true
            {
                errorLabel.text = "Enter your city name"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if cityLabel.text?.isEmpty == true
            {
                errorLabel.text = "Enter the hospital name"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if currentBloodChoice == "non" {
                errorLabel.text = "Set the blood type needed"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if phoneNumberLabel.text!.count != 10 {
                errorLabel.text = "Enter a valid phone number"
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            
            
            
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinal" {
            let destinationVC = segue.destination as! SubmitViewController
            destinationVC.firstNameVar = String((firstNameLabel.text?.prefix(10))!)
            destinationVC.lastNameVar = String((lastNameLabel.text?.prefix(10))!)
            destinationVC.phoneNumberVar = String((phoneNumberLabel.text?.prefix(10))!)
            destinationVC.cityVar = String(String(cityLabel.text!).prefix(10))
            destinationVC.hospitalNameVar = String(String(hospitalLabel.text!).prefix(20))
            destinationVC.bloodType = currentBloodChoice

        }
    }

}
