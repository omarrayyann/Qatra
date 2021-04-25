//
//  FilterViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 08/04/2021.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var citiesSwitch: UISwitch!
    @IBOutlet weak var bloodSwitch: UISwitch!
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = doneButton.frame.height / 7
        doneButton.layer.masksToBounds = true
        if Manager.shared.filterBloods == "Yours" {
            bloodSwitch.isOn = false
        }
        if Manager.shared.filterCities == "Yours" {
            citiesSwitch.isOn = false
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func donePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func citiesPressed(_ sender: Any) {
        
        Manager.shared.changed = true
        print("\(Manager.shared.changed)")

        if citiesSwitch.isOn == true {
            Manager.shared.filterCities = "All"
            print(Manager.shared.filterCities)
            
        }
        else{
            
            Manager.shared.filterCities = "Yours"
            print(Manager.shared.filterCities)

        }
    }
    
    
    


     @IBAction func otherPressed(_ sender: Any) {
        Manager.shared.changed = true
        print("\(Manager.shared.changed)")

        if bloodSwitch.isOn == true {
            Manager.shared.filterBloods = "All"
            
        }
        else{
            
            Manager.shared.filterBloods = "Yours"}
     
     }
    
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
