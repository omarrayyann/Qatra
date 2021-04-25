//
//  LangaugeViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 08/04/2021.
//

import UIKit
import DropDown


class LangaugeViewController: UIViewController {

    @IBOutlet weak var wholeButton: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var langaugeButton: UIButton!
    
    let dropDown = DropDown() //2

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        doneButton.layer.cornerRadius = doneButton.frame.height / 7
        
        doneButton.layer.masksToBounds = true
        
        wholeButton.layer.cornerRadius = wholeButton.frame.height / 9
        
        wholeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        wholeButton.layer.borderWidth = 1.25
        
        wholeButton.layer.masksToBounds = true
        
        
        if let koko = UserDefaults.standard.string(forKey: "Language") {
            
            if koko == "En" {
                langaugeButton.setTitle("English", for: .normal)
                self.doneButton.setTitle("Done", for: .normal)
                self.doneButton.titleLabel?.font = UIFont(name: "Futura Medium", size: 19)
                self.doneButton.isHidden = false
                
            }
            else if koko == "Ar" {
                langaugeButton.setTitle("العربية", for: .normal)
                self.doneButton.setTitle("استمرار", for: .normal)
                self.doneButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
                self.doneButton.isHidden = false
                
            }

            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func languagesArrowPressed(_ sender: Any) {
        clickedLanguage(langaugeButton)
    }
    
    @IBAction func clickedLanguage(_ sender: Any) {
        
        dropDown.dataSource = ["العربية", "English"]//4
        dropDown.anchorView = sender as! AnchorView //5
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
          dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self!.langaugeButton.setTitle(item, for: .normal) //9
            if self!.langaugeButton.currentTitle == "English" {
                
                self!.doneButton.setTitle("Done", for: .normal)
                self!.doneButton.titleLabel?.font = UIFont(name: "Futura Medium", size: 19)
                self!.doneButton.isHidden = false

                
            }
            else if self!.langaugeButton.currentTitle == "العربية" {
                
                self!.doneButton.setTitle("استمرار", for: .normal)
                self!.doneButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
                self!.doneButton.isHidden = false


                
            }

           
      
          }
        
    }

    @IBAction func doneClicked(_ sender: Any) {
        
        wholeButton.isUserInteractionEnabled = false
        Manager.shared.changed = true
        
        if langaugeButton.currentTitle == "English" {
            
            UserDefaults.standard.setValue("En", forKey: "Language")
            
        }
        else if langaugeButton.currentTitle == "العربية" {
            
            UserDefaults.standard.setValue("Ar", forKey: "Language")

            
        }
        
        if UserDefaults.standard.string(forKey: "bloodType") == nil {
            performSegue(withIdentifier: "languagesToFirst", sender: self)
        }
        else{
            Manager.shared.changedWOW = true
            Manager.shared.kante = true
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
