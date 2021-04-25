//
//  MyViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit
import FirebaseFirestore
import Foundation
import SystemConfiguration

class MyViewController: UIViewController {
    
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
    
    
    
    func showError(title: String, error: String, WOAH: String){
        if !isInternetAvailable() {

        // create the alert
            let alert = UIAlertController(title: "\(title)", message: "\(error)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "\(WOAH)", style: .default, handler: nil)
                        alert.addAction(action)
                        present(alert, animated: true, completion: nil)
        }
        else{
            // success internet
            donePressed(buttonDone)

        }
        
    }
    
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftArrow: UIButton!
    @IBOutlet weak var rightArrow: UIButton!
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
    
    var unitsInterval: String = ""
    var unitsIntervalDone: Bool = false
    
    var currentString: String = ""
    
    func loadIt(currents: String){
        
        currentString = currents
        
        if nowShown < posts.count - 1 {
            rightArrow.isHidden = false
        }
        else{
            rightArrow.isHidden = true
        }
        
        if nowShown > 0 {
            leftArrow.isHidden = false
            print("1")
        }
        else{
            leftArrow.isHidden = true
            print("2")

        }
        
        
        firstNameDone = false
        firstName = ""
        lastNameDone = false
        lastName = ""
        phoneDone = false
        phone = ""
        cityNameDone = false
        cityName = ""
        hospitalNameDone = false
        hospitalName = ""
        extraNameDone = false
        extraName = ""
        bloodNameDone = false
        bloodName = ""
        timeIntervalDone = false
        timeInterval = ""
        unitsIntervalDone = false
        unitsInterval = ""
        
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
                let hay = current[index]
                let haynext = current[index+1]
                let haynextnext = current[index+2]
                let haynextnextnext = current[index+3]
                
                let all = "\(hay)\(haynext)\(haynextnext)\(haynextnextnext)"

                if all == "%k9k" {
                    timeIntervalDone = true
                    doIt = 3

                }
                else{
                    timeInterval.append(current[index])
                    print("timeInterval: \(bloodName)")
                }
                
            }
            else if unitsIntervalDone == false {
               
                unitsInterval = String(current.suffix(current.count - index))
                unitsIntervalDone = true
                print("timeInterval: \(unitsInterval)")

            }
                
                
                
            }
            else{
                doIt = doIt - 1
            }
            
            
            
            
            
        }
    }
    

    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var describeLabel: UILabel!
    
    @IBAction func rightClicked(_ sender: Any) {
        nowShown = nowShown+1
        rightArrow.isHidden = true
        print(posts[nowShown])
viewDidAppear(false)
        
    }
    @IBAction func leftClicked(_ sender: Any) {
        nowShown = nowShown-1
        leftArrow.isHidden = true
        print("3")
        print(posts[nowShown])
        viewDidAppear(false)

    }
    
    
    @IBOutlet weak var viewtop: UIStackView!
    @IBAction func doneClicked(_ sender: Any) {
        if Manager.shared.isEnglish() == true {
            showError(title: "Error", error: "No Internet Conection", WOAH: "Try Again")}
        else{
            showError(title: "مشكلة", error: "تأكد من وجود شبكة انترنت", WOAH: "حاول مجدداً")}
    }
    
    func updateData() {
        print("button fire")
        let alert = UIAlertController(title: "Deleting", message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10,y: 5,width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       


   

        if Manager.shared.isEnglish() == false {
            titleLabel.text = "طلباتي"
                titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
            describeLabel.text = "تأكد من اتمام طلبك عندك انتهائه"
            describeLabel.font = UIFont(name: "Avenir Medium", size: 20)
            buttonDone.setTitle("الإنتهاء", for: .normal)
            nonLabel.text = "لا يوجد لديك أي طلب"
            buttonDone.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)

            
        }
        else{
            
            titleLabel.text = "My Requests"
                titleLabel.font = UIFont(name: "Futura Bold", size: 50)
            describeLabel.text = "Make sure to delete a request once completed"
            describeLabel.font = UIFont(name: "Futura Medium", size: 20)
            buttonDone.setTitle("Done", for: .normal)
            nonLabel.text = "no requests made"
            buttonDone.titleLabel?.font = UIFont(name: "Futura Bold", size: 20)

            
        }
        
        
        viewtop.layer.cornerRadius = viewtop.frame.height / 9
        viewtop.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewtop.layer.borderWidth = 1.5
    

        buttonDone.layer.cornerRadius = buttonDone.frame.height / 7
        // Do any additional setup after loading the view.
    }
    
    
    
    func donePressed(_ sender: Any) {
        
        
        if Manager.shared.isEnglish() == true {
        let actionSheet = UIAlertController(title: "Completed Request?", message: "Are you sure you want to remove this request?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { _ in
            self.updateData()
            self.db.collection("Requests").document("requests").updateData(["requestsArray" : FieldValue.arrayRemove([self.currentString])]) { (error) in
                if let e = error {
                    print(e)
                }
                else{
                    var k = UserDefaults.standard.array(forKey: "myRequest")! as! [String]
                    let indexOfA = k.firstIndex(of: "\(self.currentString)")
                    k.remove(at: indexOfA!)
                    UserDefaults.standard.setValue(k, forKey: "myRequest")
                    self.nowShown = 0
                    self.dismiss(animated: true, completion: nil)
                    self.viewDidAppear(false)
                    // success
                }
            }
                    
                    
                }
       
        
        
        ))
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)

            present(actionSheet, animated: true)}
        else{
            let actionSheet = UIAlertController(title: "أنهيت الطلب ؟", message: "هل تريد حذف الطلب", preferredStyle: .actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: nil))
            actionSheet.addAction(UIAlertAction(title: "حذف", style: .destructive, handler: { _ in
                
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

                present(actionSheet, animated: true)}
    }
    
    var posts: [String] = []
    
    var nowShown = 0
    
    let db = Firestore.firestore()
    
    
    func removeDeleted(){
        if UserDefaults.standard.array(forKey: "myRequest")?.count ?? 0 > 0 {
            
            var currentie = UserDefaults.standard.array(forKey: "myRequest") as! [String]
            
            db.collection("Requests").document("requests").getDocument { (snapshot, error) in
                if let e = error {
                    print(e)
                }
                else{
                    var found = false
                    for current in currentie {

                    
                    var wowo = snapshot?.data()!["requestsArray"] as! [String]
                    if wowo.contains("\(current)") == true {
                        print("KAKA")
                    }
                    else{
                        
                        
                        self.db.collection("Requests").document("requests").updateData(["requestsArray" : FieldValue.arrayRemove([current])])
                            let indexOfA = currentie.firstIndex(of: "\(current)")
                        currentie.remove(at: indexOfA!)
                            print("WOWOWOWOWOWO")
                        found = true
                            
                        
                        
                    }
                        
                    }
                    if found == true {
                    self.nowShown = 0
                    UserDefaults.standard.setValue(currentie, forKey: "myRequest")
                    self.viewDidAppear(false)
                    print("omomom")
                    }
                    
                    
                }
            }
            
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        removeDeleted()
        
        if Manager.shared.isEnglish() == false {
            titleLabel.text = "طلباتي"
                titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
            describeLabel.text = "تأكد من اتمام طلبك عند انتهائه"
            describeLabel.font = UIFont(name: "Avenir Medium", size: 20)
            buttonDone.setTitle("الإنتهاء", for: .normal)
            nonLabel.text = "لا يوجد لديك أي طلب"
            buttonDone.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)

            
        }
        else{
            
            titleLabel.text = "My Requests"
                titleLabel.font = UIFont(name: "Futura Bold", size: 50)
            describeLabel.text = "Make sure to delete a request once completed"
            describeLabel.font = UIFont(name: "Futura Medium", size: 20)
            buttonDone.setTitle("Done", for: .normal)
            nonLabel.text = "no requests made"
            buttonDone.titleLabel?.font = UIFont(name: "Futura Bold", size: 20)

            
        }
        
        if UserDefaults.standard.array(forKey: "myRequest")?.count ?? 0 > 0 {
            
            self.posts = UserDefaults.standard.array(forKey: "myRequest")! as! [String]
            
        
            loadIt(currents: posts[nowShown]  as! String)
            
          
            
            
            name.text = "\(firstName) \(lastName)"
            Manager.shared.fill()
            if Manager.shared.isEnglish() == true {
            location.text = "\(hospitalName) in \(cityName)"
            }
            else{
                
                var k = Manager.shared.hospitalsArabic[Manager.shared.hodpitals.firstIndex(of: hospitalName) ?? 71]
                if k == "آخر" {
                    k = hospitalName
                }
                location.text = "\(k) في \(Manager.shared.EnToAr[cityName]!)"

            }
            
            if Manager.shared.isEnglish() == false {
                phoneLabel.text = "التواصل: \(phone)"
                bloodType.text = "نوع الدم: \(bloodName)"
                unitsLabel.text = "\(unitsInterval) جرعة محتاجة"
                phoneLabel.font = UIFont(name: "Avenir Medium", size: 27)
                bloodType.font = UIFont(name: "Avenir Medium", size: 20)
                unitsLabel.font = UIFont(name: "Avenir Medium", size: 17)

                
                
            }
            
            else{
                phoneLabel.text = "Contact: \(phone)"
                bloodType.text = "Blood Type: \(bloodName)"
                unitsLabel.text = "\(unitsInterval) Units needed"
                phoneLabel.font = UIFont(name: "Futura Medium", size: 27)
                bloodType.font = UIFont(name: "Futura Medium", size: 20)
                unitsLabel.font = UIFont(name: "Futura Medium", size: 17)
                
                
            }
            
            
            
           
            viewtop.isHidden = false
            phoneLabel.isHidden = false
            bloodType.isHidden = false
            buttonDone.isHidden = false
            nonLabel.isHidden = true
            unitsLabel.isHidden = false
            
        }
        else{
            viewtop.isHidden = true
            phoneLabel.isHidden = true
            bloodType.isHidden = true
            buttonDone.isHidden = true
            nonLabel.isHidden = false
            unitsLabel.isHidden = true
        }
    }

    @IBOutlet weak var nonLabel: UILabel!
}
