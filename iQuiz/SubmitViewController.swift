//
//  SubmitViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 05/04/2021.
//

import UIKit
import FirebaseFirestore

class SubmitViewController: UIViewController {

    
    var firstNameVar: String?
    var lastNameVar: String?
    var phoneNumberVar: String?
    var cityVar: String?
    var hospitalNameVar: String?
    var bloodType: String?
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var submit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancel.layer.cornerRadius = cancel.frame.height / 5
        submit.layer.cornerRadius = submit.frame.height / 5

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let db = Firestore.firestore()
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "Submit" {
        indicator.isHidden = false
        cancel.isHidden = true
            submit.isHidden = true
            textView.isUserInteractionEnabled = false
        
        let stringSent = "\(firstNameVar!)%k9k\(lastNameVar!)%k9k\(phoneNumberVar!)%k9k\(cityVar!)%k9k\(hospitalNameVar!)%k9k\(textView.text.prefix(300))%k9k\(bloodType!)%k9k\(Date().timeIntervalSince1970)"
        
        // Omar%k9kRayyan%k9k0795690667%k9kAmman%k9kAl Noor Hospital%k9kIt is very urgent please%k9kAB-%k9k391371233
        
        db.collection("Requests").document("requests").updateData(["requestsArray" : FieldValue.arrayUnion([stringSent])]) { (error) in
            if let e = error {
                print(e)
            }
            else{
                
                UserDefaults.standard.setValue(stringSent, forKey: "myRequest")
                
                self.indicator.isHidden = true
                self.submit.setTitle("Done", for: .normal)
                self.textView.isHidden = true
                self.doneLabel.isHidden = false
                self.submit.isHidden = false
                self.doneLabel.shake()
                self.titleUp.isHidden = true
                self.kingTitle.text = "Thanks"
                // success upload
                
            }
        }
        
        
        
        }
        
        else if sender.currentTitle == "Done" {
            dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBOutlet weak var kingTitle: UILabel!
    @IBOutlet weak var titleUp: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
}
