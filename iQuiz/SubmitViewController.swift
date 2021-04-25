//
//  SubmitViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 05/04/2021.
//

import UIKit
import FirebaseFirestore
import DropDown
import Foundation
import SystemConfiguration


class SubmitViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    func isInternetAvailable() -> Bool
       {
           var zeroAddress = sockaddr_in()
           zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
           zeroAddress.sin_family = sa_family_t(AF_INET)

           let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
               $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                   SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
               }
           }

           var flags = SCNetworkReachabilityFlags()
           if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
               return false
           }
           let isReachable = flags.contains(.reachable)
           let needsConnection = flags.contains(.connectionRequired)
           return (isReachable && !needsConnection)
       }


    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.last == "\n" { //Check if last char is newline
            textView.text.removeLast() //Remove newline
              textView.resignFirstResponder() //Dismiss keyboard
          }
      }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 140 // Pass your character count here
    }
    
    
    var firstNameVar: String?
    var lastNameVar: String?
    var phoneNumberVar: String?
    var cityVar: String?
    var hospitalNameVar: String?
    var bloodType: String?
    
    let arrayCodes = ["079", "078", "077", "06"]
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    let numberToolbar: UIToolbar = UIToolbar()
    
    
    @objc func boopla () {
        phoneLabel.resignFirstResponder()
    }

    @objc func hoopla () {
        phoneLabel.resignFirstResponder()
    }

    func addDone(){
        
        if Manager.shared.isEnglish() == true {
        numberToolbar.barStyle = UIBarStyle.default
        
        numberToolbar.isTranslucent = true
        
           numberToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.plain, target: self, action: #selector(boopla))
           ]

           numberToolbar.sizeToFit()

            phoneLabel.inputAccessoryView = numberToolbar}
        else{
            numberToolbar.barStyle = UIBarStyle.default
            
            numberToolbar.isTranslucent = true
            
               numberToolbar.items=[
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
                UIBarButtonItem(title: "اتمام", style: UIBarButtonItem.Style.plain, target: self, action: #selector(boopla))
               ]

               numberToolbar.sizeToFit()

                phoneLabel.inputAccessoryView = numberToolbar}
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDone()
        textView.delegate = self
        phoneLabel.delegate = self
        textView.layer.borderWidth = 1.25
        textView.layer.cornerRadius = textView.frame.height / 9
        phoneLabel.keyboardType = .asciiCapableNumberPad
        numberView.layer.cornerRadius = numberView.frame.height / 9
        numberView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        numberView.layer.borderWidth = 1.25
        numberView.layer.masksToBounds = true
        phoneLabel.addTarget(self, action: #selector(self.pphoneChanged(_:)), for: UIControl.Event.editingChanged)

        
        if Manager.shared.isEnglish() == false {
            kingTitle.text = "نشر الطلب"
            titleUp.text = "معلومات إضافية"
            unitsLabel.text = "الجرع المرادة: 1"
            kingTitle.font = UIFont(name: "Avenir Heavy", size: 50)
            titleUp.font = UIFont(name: "Avenir Medium", size: 25)
            phoneLabel.placeholder = "رقم الهاتف"
            doneLabel.text = "تم النشر بنجاح"
            doneLabel.font = UIFont(name: "Avenir Heavy", size: 23)
            cancel.setTitle("إلغاء", for: .normal)
            submit.setTitle("نشر", for: .normal)
            cancel.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 17)
            submit.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 17)
        }
        else{
            kingTitle.text = "Submit Request"
            titleUp.text = "Add any extra info"
            unitsLabel.text = "Number of units needed: 1"
            kingTitle.font = UIFont(name: "Futura Bold", size: 50)
            titleUp.font = UIFont(name: "Futura Medium", size: 25)
            phoneLabel.placeholder = "Phone Number"
            doneLabel.text = "successfully submitted request"
            doneLabel.font = UIFont(name: "Futura Bold", size: 23)
            cancel.setTitle("Cancel", for: .normal)
            submit.setTitle("Submit", for: .normal)
            cancel.titleLabel?.font = UIFont(name: "Futura Bold", size: 17)
            submit.titleLabel?.font = UIFont(name: "Futura Bold", size: 17)
            
        }
        
        
        
        cancel.layer.cornerRadius = cancel.frame.height / 5
        submit.layer.cornerRadius = submit.frame.height / 5

        // Do any additional setup after loading the view.
    }
    let dropDown = DropDown() //2

    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var code: UIButton!
    @IBAction func arrowClicked(_ sender: Any) {
        textView.resignFirstResponder() //Dismiss keyboard
        codeClicked(code)
    }
    @IBAction func codeClicked(_ sender: Any) {
        textView.resignFirstResponder() //Dismiss keyboard

        
        dropDown.dataSource = arrayCodes

        dropDown.anchorView = sender as! AnchorView //5
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
          dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self!.code.setTitle(item, for: .normal) //9
          
          }
        
    }
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    @IBOutlet weak var phoneLabel: UITextField!
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var slider: UISlider!
    
    
    func showError(error: String){
        if !isInternetAvailable() {
        phoneNumberVar = "\(code.currentTitle!)\(phoneLabel.text!.prefix(7))"
        indicator.isHidden = true
        cancel.isHidden = false
        textView.isHidden = false
        numberView.isHidden = false
        submit.isHidden = false
        slider.isHidden = false
        unitsLabel.isHidden = false
        textView.isUserInteractionEnabled = true
        phoneLabel.isUserInteractionEnabled = true
        // create the alert
            if Manager.shared.isEnglish() == true {
                errorLabel.text = "No Internet Connection"}
            else{
                errorLabel.text = "تأكد من وصولك للشبكة"
            }
            errorLabel.isHidden = false
            errorLabel.shake()
        }
        else{
            submitPressed(submit)
        }
        
    }
    
    @IBAction func trigger(_ sender: Any) {
        self.showError(error: "Check your internet connection and try again")

    }
    
 
    func submitPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "Submit" || sender.currentTitle == "نشر" {
            
        
            
            if phoneLabel.text?.count == 7 {
                phoneNumberVar = "\(code.currentTitle!)\(phoneLabel.text!.prefix(7))"
                errorLabel.isHidden = true
        indicator.isHidden = false
        cancel.isHidden = true
                textView.isHidden = true
                numberView.isHidden = true
            submit.isHidden = true
                slider.isHidden = true
                unitsLabel.isHidden = true
            textView.isUserInteractionEnabled = false
                phoneLabel.isUserInteractionEnabled = false
        
        let stringSent = "\(firstNameVar!)%k9k\(lastNameVar!)%k9k\(phoneNumberVar!)%k9k\(cityVar!)%k9k\(hospitalNameVar!)%k9k\(textView.text.prefix(140))%k9k\(bloodType!)%k9k\(Date().timeIntervalSince1970)%k9k\(currentUnits)"
        
        // Omar%k9kRayyan%k9k0795690667%k9kAmman%k9kAl Noor Hospital%k9kIt is very urgent please%k9kAB-%k9k391371233
        
        db.collection("Requests").document("requests").updateData(["requestsArray" : FieldValue.arrayUnion([stringSent])]) { (error) in
            print("HOHO")
            if let e = error {
                print(e)
                
            }
            else{
                if let current = UserDefaults.standard.array(forKey: "myRequest") {
                    var b = current
                    b.append(stringSent)
                    UserDefaults.standard.setValue(b, forKey: "myRequest")
                    print("1")

                }
                else{
                    UserDefaults.standard.setValue([stringSent], forKey: "myRequest")
                    print("2")

                }
                
                
                self.indicator.isHidden = true
                if Manager.shared.isEnglish() == true {
                    self.submit.setTitle("Done", for: .normal)
                    self.kingTitle.text = "Thanks"
                    Manager.shared.butter = true

                }
                else{
                    
                    self.kingTitle.text = "شكراً"

                    self.submit.setTitle("استمرار", for: .normal)}
                
                self.textView.isHidden = true
                self.phoneLabel.isHidden = true
                self.doneLabel.isHidden = false
                self.submit.isHidden = false
                self.slider.isHidden = true
                self.unitsLabel.isHidden = true
                self.titleUp.isHidden = true
                self.errorLabel.isHidden = true
                // success upload
                
            }
        }
        
        
        }
        else{
            if Manager.shared.isEnglish() == true {
            errorLabel.text = "Enter a correct phone numebr"
            errorLabel.isHidden = false
                errorLabel.shake()}
            else{
                errorLabel.text = "الرجاء إدخال رقم هاتف صحيح"
                errorLabel.isHidden = false
                    errorLabel.shake()}
        }
        }
        
        else if sender.currentTitle == "Done" || sender.currentTitle == "استمرار" {
            dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    
    var currentUnits: Int = 1
    
    @IBAction func switcher(_ sender: UISlider) {
        textView.resignFirstResponder() //Dismiss keyboard
        if Manager.shared.isEnglish() == true {
        unitsLabel.text = "Number of units needed: \(Int(sender.value))"
            currentUnits = Int(sender.value)}
        else{
            unitsLabel.text = "الجرع المرادة: \(Int(sender.value))"
                currentUnits = Int(sender.value)}
        
        
        
        
    }
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var kingTitle: UILabel!
    @IBOutlet weak var titleUp: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    
    
    
    
    @objc func pphoneChanged(_ textField: UITextField) {
        if let text:String = phoneLabel.text {
            DispatchQueue.main.async {
                //removing bad characters from last name
                var boo = text
                    if boo.count > 7{
                        boo.removeLast()}
                self.phoneLabel.text = boo

                
                
        }

        }}
}
