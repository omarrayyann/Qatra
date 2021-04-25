//
//  AboutViewController.swift
//  Pods
//
//  Created by Omar Rayyan on 09/04/2021.
//

import UIKit

class AboutieViewController: UIViewController {

    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = nextButton.frame.height / 7
        infoLabel.text = arrayEn[0]
        infoAr.text = arrayAR[0]

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nextButton: UIButton!
    var arrayEn = ["Qatra is a platform that connects those who are in need of blood units in Jordan with potential blood donors"]
    
    var arrayAR = ["قطرة هي منصة تعمل على الربط بين من هم بحاجة لوحدات من الدم والمتبرعين في الأردن"]
    
    
    @IBOutlet weak var infoAr: UILabel!
    @IBAction func nextClicked(_ sender: Any) {
    
            
            UserDefaults.standard.setValue("seen", forKey: "sawTot")
            dismiss(animated: true, completion: nil)
            
    
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
