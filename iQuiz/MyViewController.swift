//
//  MyViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit
import FirebaseFirestore

class MyViewController: UIViewController {
    
    var firstName: String = ""
    var firstNameDone: Bool = false

    var lastName: String = ""
    var lastNameDone: Bool = false
    
    var phone: String = ""
    var phoneDone: Bool = false

    var cityName: String = ""
    var cityNameDone: Bool = false
    
    var hospitalName: String = ""
    var hospitalNameDone: Bool = false
    
    var extraName: String = ""
    var extraNameDone: Bool = false

    var bloodName: String = ""
    var bloodNameDone: Bool = false
    
    var timeInterval: String = ""
    var timeIntervalDone: Bool = false
    
    
    func loadIt(currents: String){
        
        var current = Array(currents)
        var doIt = 0
        var counter = 0
        for index in 0...current.count {
            
            
            if doIt == 0 {
            if firstNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    firstNameDone = true
                    doIt = 3
                }
                else{
                firstName.append(current[index])
                    print("firstName: \(firstName)")
                }
                
            }
            else if lastNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    lastNameDone = true
                    doIt = 3

                }
                else{
                    lastName.append(current[index])
                    print("lastName: \(lastName)")
                }
                
            }
            else if phoneDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    phoneDone = true
                    doIt = 3

                }
                else{
                    phone.append(current[index])
                    print("phone: \(phone)")
                }
                
            }
            else if cityNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    cityNameDone = true
                    doIt = 3

                }
                else{
                    cityName.append(current[index])
                    print("cityName: \(cityName)")
                }
                
            }
            else if hospitalNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    hospitalNameDone = true
                    doIt = 3

                }
                else{
                    hospitalName.append(current[index])
                    print("hospitalName: \(hospitalName)")
                }
                
            }
            else if extraNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    extraNameDone = true
                    doIt = 3

                }
                else{
                    extraName.append(current[index])
                    print("extraName: \(extraName)")
                }
                
            }
            else if phoneDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    phoneDone = true
                    doIt = 3

                }
                else{
                    phone.append(current[index])
                    print("phone: \(phone)")
                }
                
            }
            else if bloodNameDone == false {
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    bloodNameDone = true
                    doIt = 3

                }
                else{
                    bloodName.append(current[index])
                    print("bloodName: \(bloodName)")
                }
                
            }
            else if timeIntervalDone == false {
               
                timeInterval = String(current.suffix(current.count - index))
                timeIntervalDone = true
                print("timeInterval: \(timeInterval)")

            }
                
                
                
                
                
            }
            else{
                doIt = doIt - 1
            }
            
            
            
            
            
        }
    }
    

    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    
    @IBOutlet weak var viewtop: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewtop.layer.cornerRadius = viewtop.frame.height / 7
        buttonDone.layer.cornerRadius = buttonDone.frame.height / 7
        // Do any additional setup after loading the view.
    }
    
    @IBAction func donePressed(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Completed Request?", message: "Are you sure you want to remove this request?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { _ in
            
            self.db.collection("Requests").document("requests").updateData(["requestsArray" : FieldValue.arrayRemove([UserDefaults.standard.string(forKey: "myRequest")])]) { (error) in
                if let e = error {
                    print(e)
                }
                else{
                    UserDefaults.standard.setValue(nil, forKey: "myRequest")
                    self.viewDidAppear(false)
                    // success
                }
            }
                    
                    
                }
       
        
        
        ))
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)

        present(actionSheet, animated: true)
    }
    
    
    let db = Firestore.firestore()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        if UserDefaults.standard.string(forKey: "myRequest") != nil {
            
        
            loadIt(currents: UserDefaults.standard.string(forKey: "myRequest") as! String)
            
            name.text = "\(firstName) \(lastName)"
            location.text = "\(hospitalName) in \(cityName)"
            phoneLabel.text = "Contact: \(phone)"
            bloodType.text = "Blood Type: \(bloodName)"
            viewtop.isHidden = false
            phoneLabel.isHidden = false
            bloodType.isHidden = false
            buttonDone.isHidden = false
            nonLabel.isHidden = true
            
        }
        else{
            viewtop.isHidden = true
            phoneLabel.isHidden = true
            bloodType.isHidden = true
            buttonDone.isHidden = true
            nonLabel.isHidden = false
        }
    }

    @IBOutlet weak var nonLabel: UILabel!
}
