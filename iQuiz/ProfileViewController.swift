//
//  ProfileViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 05/04/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    
    var phoneNumber: String?
    
    var stringed: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func callPressed(_ sender: Any) {
        
        let phone = "tel://982374234"
        let url = URL(string: phone)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    

}
