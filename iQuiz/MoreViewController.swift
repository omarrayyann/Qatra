//
//  ProfileViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 05/04/2021.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    
    @IBOutlet weak var buttoncall: UIButton!
    @IBOutlet weak var topView: UIStackView!
    
    var nameVar: String = ""
    var locationVar: String = ""
    var noteVar: String = ""
    var bloodVar: String = ""
    var phoneVar: String = ""
    var timeVar: String = ""
    var stringed: String?
    
    @IBOutlet weak var heightBar: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if Manager.shared.isEnglish() == false {
            titleLabel.text = "فصيلة دمك متوافقة"
            titleLabel.font = UIFont(name: "Avenir Heavy", size: 21)
            nameLabel.font = UIFont(name: "Avenir Heavy", size: 35)
            bloodLabel.font = UIFont(name: "Avenir Heavy", size: 20)
            buttoncall.setTitle("اتصال", for: .normal)
            buttoncall.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)

        }
        
        if bloodVar.contains(UserDefaults.standard.string(forKey: "bloodType")!) == false && bloodVar.contains("All") == false && bloodVar.contains("الكل") == false {
            if Manager.shared.isEnglish() == false {
                titleLabel.text = "فصيلة دمك غير متوافقة"
                titleLabel.font = UIFont(name: "Avenir Heavy", size: 21)
                
            }
            else{
                titleLabel.text = "You're not Compatible"}
            titleLabel.backgroundColor = UIColor(named: "WrongColor")
            titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        timeLabel.text = timeVar
        phoneLabel.text = phoneVar
        heightBar.constant = windowHeight() / 10
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 7
        titleLabel.layer.masksToBounds = true
        buttoncall.layer.cornerRadius = buttoncall.frame.height / 8
        topView.layer.cornerRadius = titleLabel.frame.height / 7
        topView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        topView.layer.borderWidth = 1.5
        titleLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.layer.borderWidth = 1.5
        nameLabel.text = String(nameVar.dropFirst(3))
        locationLabel.text = locationVar
        noteLabel.text = noteVar
        bloodLabel.text = bloodVar
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func callPressed(_ sender: Any) {
        
        if let phoneCallURL = URL(string: "telprompt://\(phoneVar)") {

            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                     application.openURL(phoneCallURL as URL)

                }
            }
        }
        
    }
    
    func windowHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }

    func windowWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    

}
