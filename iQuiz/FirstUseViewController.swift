//
//  FirstUseViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//


import UIKit
import DropDown


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
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var cityWhole: UIView!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var allBlood: UIView!
    
    let dropDown = DropDown() //2
    
    

    
    @IBAction func clickedCity(_ sender: Any) {
    
        
        if UserDefaults.standard.string(forKey: "Language") == "Ar" {
            
            dropDown.dataSource = arrayCitiesAr
            print("ars")

            
        }
        else if UserDefaults.standard.string(forKey: "Language") == "En" {

            print("enj")
        dropDown.dataSource = arrayCities
            
        }
        
        
        dropDown.anchorView = sender as! AnchorView //5
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
          dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self!.cityButton.setTitle(item, for: .normal)
            self!.currentCIty = item
            UserDefaults.standard.setValue(self!.currentCIty, forKey: "city")
            Manager.shared.changed = true
            print("\(Manager.shared.changed)")

         
          }
        
    }
    
    let arrayCities = ["Amman", "Zarqa", "Irbid", "Aqaba", "Madaba", "Al Balqa", "Al Mafraq", "Ajloun"]
    
    
    let arrayCitiesAr = ["عمان", "الزرقاء", "اربد", "العقبة", "مادبا", "البلقاء", "المفرق", "عجلون"]
    
    
    @IBAction func cityArrowPressed(_ sender: Any) {
        
        clickedCity(cityButton)
    }
  
    
    @IBOutlet weak var firstQ: UILabel!
    @IBOutlet weak var secondQ: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Manager.shared.fill()
        
        cityWhole.layer.cornerRadius = cityWhole.frame.height / 9
        
        cityWhole.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cityWhole.layer.borderWidth = 1.25
        
        
        currentCIty = UserDefaults.standard.string(forKey: "city") ?? "City"

        if Manager.shared.isEnglish() == false {
            firstQ.text = "في أي مدينة تسكن"
            secondQ.text = "ما هي فصيلة دمك"
            firstQ.font = UIFont(name: "Avenir Heavy", size: 20)
            secondQ.font = UIFont(name: "Avenir Heavy", size: 20)
            button9.setTitle("لا أعلم فصيلة دمي", for: .normal)
            button9.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 16)
            doneButton.setTitle("استمرار", for: .normal)
            doneButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
            if currentCIty == "City" {
                currentCIty = "المدينة"
                cityButton.setTitle("المدينة", for: .normal)
            }
            else{
                print(currentCIty)
                currentCIty = Manager.shared.EnToAr[currentCIty]!
            }
            
            
        }
        else{
            
            firstQ.text = "Which city do you live in"
            secondQ.text = "What's your blood type"
            firstQ.font = UIFont(name: "Futura Bold", size: 20)
            secondQ.font = UIFont(name: "Futura Bold", size: 20)
            button9.setTitle("I don't know my blood type", for: .normal)
            button9.titleLabel?.font = UIFont(name: "Futura Medium", size: 16)
            doneButton.setTitle("Done", for: .normal)
            doneButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 19)
            if currentCIty == "المدينة" {
                currentCIty = "City"
                cityButton.setTitle("City", for: .normal)
            }
            else{
                print(currentCIty)
         
            }
            
            
            
            
            
            
            
        }
        
         
       
        cityWhole.layer.masksToBounds = true
        
        
        cityButton.setTitle(currentCIty, for: .normal)
        
 

        
        switch UserDefaults.standard.string(forKey: "bloodType") {
        case "AB+":
            currentBloodChoice = "AB+"
            button1.backgroundColor = OtherColor
            button1.layer.cornerRadius = button1.frame.height / 5
            button1.setTitleColor(MainColor, for: .normal)
        case "AB-":
            currentBloodChoice = "AB-"
            button2.backgroundColor = OtherColor
            button2.layer.cornerRadius = button2.frame.height / 5
            button2.setTitleColor(MainColor, for: .normal)
        case "A+":
            currentBloodChoice = "A+"
            button3.backgroundColor = OtherColor
            button3.layer.cornerRadius = button3.frame.height / 5
            button3.setTitleColor(MainColor, for: .normal)
        case "A-":
            currentBloodChoice = "A-"
            button4.backgroundColor = OtherColor
            button4.layer.cornerRadius = button4.frame.height / 5
            button4.setTitleColor(MainColor, for: .normal)
        case "B+":
            currentBloodChoice = "B+"
            button5.backgroundColor = OtherColor
            button5.layer.cornerRadius = button5.frame.height / 5
            button5.setTitleColor(MainColor, for: .normal)
        case "B-":
            currentBloodChoice = "B-"
            button6.backgroundColor = OtherColor
            button6.layer.cornerRadius = button6.frame.height / 5
            button6.setTitleColor(MainColor, for: .normal)
        case "O+":
            currentBloodChoice = "O+"
            button7.backgroundColor = OtherColor
            button7.layer.cornerRadius = button7.frame.height / 5
            button7.setTitleColor(MainColor, for: .normal)
        case "O-":
            currentBloodChoice = "O-"
            button8.backgroundColor = OtherColor
            button8.layer.cornerRadius = button8.frame.height / 5
            button8.setTitleColor(MainColor, for: .normal)
        case "N/A":
            currentBloodChoice = "N/A"
            button9.backgroundColor = OtherColor
            button9.layer.cornerRadius = button9.frame.height / 5
            button9.setTitleColor(MainColor, for: .normal)
        default:
            print("her")
        }

        
        doneButton.layer.cornerRadius = doneButton.frame.height / 7
        
        // Do any additional setup after loading the view.
    }
    
    let OtherColor = UIColor(named: "OtherColor")
    let MainColor = UIColor(named: "MainColor")
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        Manager.shared.changed = true
        print("\(Manager.shared.changed)")

        button1.backgroundColor = nil
        button2.backgroundColor = nil
        button3.backgroundColor = nil
        button4.backgroundColor = nil
        button5.backgroundColor = nil
        button6.backgroundColor = nil
        button7.backgroundColor = nil
        button8.backgroundColor = nil
        button9.backgroundColor = nil

        button1.setTitleColor(OtherColor, for: .normal)
        button2.setTitleColor(OtherColor, for: .normal)
        button3.setTitleColor(OtherColor, for: .normal)
        button4.setTitleColor(OtherColor, for: .normal)
        button5.setTitleColor(OtherColor, for: .normal)
        button6.setTitleColor(OtherColor, for: .normal)
        button7.setTitleColor(OtherColor, for: .normal)
        button8.setTitleColor(OtherColor, for: .normal)
        button9.setTitleColor(OtherColor, for: .normal)
        
        currentBloodChoice = sender.currentTitle!
        
        if currentBloodChoice == "I don't know my blood type" || currentBloodChoice == "لا أعلم فصيلة دمي"{
            currentBloodChoice = "N/A"
        }
        
        sender.backgroundColor = OtherColor
        sender.layer.cornerRadius = sender.frame.height / 5
        sender.setTitleColor(MainColor, for: .normal)

    }
    
    var currentBloodChoice: String = "non"
    var currentCIty: String = "non"

    
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func doneButtonPressed(_ sender: Any) {
        if currentBloodChoice == "non" {
                
            if Manager.shared.isEnglish() == true {
                errorLabel.text = "choose your blood type"}
            else{
                errorLabel.text = "اختر فصيلة دمك"

            }
            errorLabel.isHidden = false
            errorLabel.shake()
            
        }
        else if currentCIty == "City" || currentCIty == "المدينة"{
            
            if Manager.shared.isEnglish() == true {
                errorLabel.text = "choose your city"}
            else{
                errorLabel.text = "اختر مدينتك"

            }
            errorLabel.isHidden = false
            errorLabel.shake()
        }
        else{
            if Manager.shared.isEnglish() == false {
                Manager.shared.fill()
                currentCIty = Manager.shared.ArToEn[currentCIty] ?? currentCIty
            }
            UserDefaults.standard.setValue(currentBloodChoice, forKey: "bloodType")
            UserDefaults.standard.setValue(currentCIty, forKey: "city")
            print("KAKA\(currentCIty)")
            
            
            
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            
            
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirst" {
            
            let destinationVC = segue.destination as! ViewController
            
            
            destinationVC.doIt = true
            
            
        }
    }
    
}
