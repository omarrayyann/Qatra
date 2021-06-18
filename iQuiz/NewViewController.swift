//
//  NewViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit
import DropDown
import Foundation
import SystemConfiguration

class NewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var alreadyLabel: UILabel!
    @IBOutlet weak var hospitalWhole: UIView!
    @IBOutlet weak var hospitalButton: UIButton!
    @IBOutlet weak var wholeLayerView: UIView!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var otherTextField: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var cityWhole: UIView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        if Manager.shared.butter == true {
            Manager.shared.butter = false
            firstNameLabel.text = ""
            lastNameLabel.text = ""
            
            if Manager.shared.isEnglish() == true {
            cityButton.setTitle("City", for: .normal)
                hospitalButton.setTitle("Hospital", for: .normal)}
            else{
                cityButton.setTitle("المدينة", for: .normal)
                    hospitalButton.setTitle("المستشفى", for: .normal)}
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

        }
        
        
        
        Manager.shared.fill()
        errorLabel.isHidden = true
        
        
        if Manager.shared.changedWOW == true {
            Manager.shared.changedWOW = false
            
            
            
        if Manager.shared.isEnglish() == false {
            
            button9.setTitle("الكل", for: .normal)
            otherTextField.text = "آخر"
            titleLabel.text = "طلب جديد"
            titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
            
            alreadyLabel.text = "لديك طلب قيد العمل، لإنشاء طلب جديد عليك إلغاء طلبك السابق"
            firstNameLabel.placeholder = "الإسم الأول"
            lastNameLabel.placeholder = "الإسم الأخير"
            buttonSubmit.setTitle("استمرار", for: .normal)
            buttonSubmit.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
            cityButton.setTitle("المدينة", for: .normal)
            hospitalButton.setTitle("المستشفى", for: .normal)

        
        }
        else{
            button9.setTitle("All", for: .normal)

            otherTextField.text = "Other"
            titleLabel.text = "Announce a blood call"
            titleLabel.font = UIFont(name: "Futura Bold", size: 50)
            
            alreadyLabel.text = "You already have a pending request, cancel it to start another"
            firstNameLabel.placeholder = "First Name"
            lastNameLabel.placeholder = "Last Name"
            buttonSubmit.setTitle("Continue", for: .normal)
            buttonSubmit.titleLabel?.font = UIFont(name: "Futura Bold", size: 19)
            cityButton.setTitle("City", for: .normal)
            hospitalButton.setTitle("Hospital", for: .normal)

            
        }
        
    }
    }
    
    
      
      let OtherColor = UIColor(named: "OtherColor")
      let MainColor = UIColor(named: "MainColor")
      
    @objc func firstnameLabelChanged(_ textField: UITextField) {
        if let text:String = firstNameLabel.text {
            DispatchQueue.main.async {
                //removing bad characters from first name
                var boo = text
                    if boo.count > 12{
                        boo.removeLast()              }
                self.firstNameLabel.text = boo

                
                
        }

        }}
    @objc func lastnameLabelChanged(_ textField: UITextField) {
        if let text:String = lastNameLabel.text {
            DispatchQueue.main.async {
                //removing bad characters from last name
                var boo = text
                    if boo.count > 12{
                        boo.removeLast()}
    
                self.lastNameLabel.text = boo

                
                
        }

        }}
    @objc func otherChanged(_ textField: UITextField) {
        if let text:String = otherTextField.text {
            DispatchQueue.main.async {
                //removing bad characters from last name
                var boo = text
                    if boo.count > 30{
                        boo.removeLast()}
                self.otherTextField.text = boo

                
                
        }

        }}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.delegate = self
        lastNameLabel.delegate = self
        Manager.shared.fill()
        firstNameLabel.addTarget(self, action: #selector(self.firstnameLabelChanged(_:)), for: UIControl.Event.editingChanged)
        lastNameLabel.addTarget(self, action: #selector(self.lastnameLabelChanged(_:)), for: UIControl.Event.editingChanged)
        otherTextField.addTarget(self, action: #selector(self.otherChanged(_:)), for: UIControl.Event.editingChanged)
        
        firstNameLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        firstNameLabel.layer.borderWidth = 1.25
        firstNameLabel.layer.cornerRadius = firstNameLabel.frame.height / 9
        
        lastNameLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lastNameLabel.layer.borderWidth = 1.25
        lastNameLabel.layer.cornerRadius = lastNameLabel.frame.height / 9
        
        otherTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        otherTextField.layer.borderWidth = 1.25
        otherTextField.layer.cornerRadius = lastNameLabel.frame.height / 9
        otherTextField.layer.masksToBounds = true
        
        cityWhole.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cityWhole.layer.borderWidth = 1.25
        
        hospitalWhole.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        hospitalWhole.layer.borderWidth = 1.25
        
        if Manager.shared.isEnglish() == false {
            
            button9.setTitle("الكل", for: .normal)
            otherTextField.text = "آخر"
            titleLabel.text = "طلب جديد"
            titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
            
            alreadyLabel.text = "لديك طلب قيد العمل، لإنشاء طلب جديد عليك إلغاء طلبك السابق"
            firstNameLabel.placeholder = "الإسم الأول"
            lastNameLabel.placeholder = "الإسم الأخير"
            buttonSubmit.setTitle("استمرار", for: .normal)
            buttonSubmit.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
            cityButton.setTitle("المدينة", for: .normal)
            hospitalButton.setTitle("المستشفى", for: .normal)

        
        }
        else{
            button9.setTitle("All", for: .normal)

            otherTextField.text = "Other"
            titleLabel.text = "Announce a blood call"
            titleLabel.font = UIFont(name: "Futura Bold", size: 50)
            
            alreadyLabel.text = "You already have a pending request, cancel it to start another"
            firstNameLabel.placeholder = "First Name"
            lastNameLabel.placeholder = "Last Name"
            buttonSubmit.setTitle("Continue", for: .normal)
            buttonSubmit.titleLabel?.font = UIFont(name: "Futura Bold", size: 19)
            cityButton.setTitle("City", for: .normal)
            hospitalButton.setTitle("Hospital", for: .normal)

            
        }
        
        
        
        buttonSubmit.layer.cornerRadius = buttonSubmit.frame.height / 5
        
        cityWhole.layer.cornerRadius = cityWhole.frame.height / 8
        
        cityWhole.layer.masksToBounds = true
      

        hospitalWhole.layer.cornerRadius = hospitalWhole.frame.height / 8
        
        hospitalWhole.layer.masksToBounds = true
    
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [self] timer in
//            if UserDefaults.standard.string(forKey: "myRequest") != nil {
//                self.wholeLayerView.isHidden = false
//                firstNameLabel.text = ""
//                lastNameLabel.text = ""
//                button1.backgroundColor = nil
//                button2.backgroundColor = nil
//                button3.backgroundColor = nil
//                button4.backgroundColor = nil
//                button5.backgroundColor = nil
//                button6.backgroundColor = nil
//                button7.backgroundColor = nil
//                button8.backgroundColor = nil
//                button9.backgroundColor = nil
//                button1.setTitleColor(OtherColor, for: .normal)
//                button2.setTitleColor(OtherColor, for: .normal)
//                button3.setTitleColor(OtherColor, for: .normal)
//                button4.setTitleColor(OtherColor, for: .normal)
//                button5.setTitleColor(OtherColor, for: .normal)
//                button6.setTitleColor(OtherColor, for: .normal)
//                button7.setTitleColor(OtherColor, for: .normal)
//                button8.setTitleColor(OtherColor, for: .normal)
//                button9.setTitleColor(OtherColor, for: .normal)
//                if Manager.shared.isEnglish() == false {
//                    hospitalButton.setTitle("المستشفى", for: .normal)
//                    cityButton.setTitle("المدينة", for: .normal)
//
//
//                }                else {
//                    hospitalButton.setTitle("Hospital", for: .normal)
//                    cityButton.setTitle("City", for: .normal)
//
//                }
//
//
//            }
//            else{
                
                self.wholeLayerView.isHidden = true

                
                

//            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            if textField == firstNameLabel {
                lastNameLabel.becomeFirstResponder()
            } else if textField == lastNameLabel {
                textField.resignFirstResponder()
            }
            return true
        }
    
    
    
    
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
    
    
    
    @IBAction func cityArrowPressed(_ sender: Any) {
        firstNameLabel.resignFirstResponder()
        lastNameLabel.resignFirstResponder()

        clickedCity(cityButton)
    }
    @IBAction func clickedHospitalArrow(_ sender: Any) {
        firstNameLabel.resignFirstResponder()
        lastNameLabel.resignFirstResponder()
        clickedHospitals(hospitalButton)
    }
    
    func showError(title: String, error: String, WOAH: String){
        if !isInternetAvailable() {

        // create the alert
            errorLabel.isHidden = true
            let alert = UIAlertController(title: "\(title)", message: "\(error)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "\(WOAH)", style: .default, handler: nil)
                        alert.addAction(action)
                        present(alert, animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: "toFinal", sender: self)

        }
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        firstNameLabel.resignFirstResponder()
        lastNameLabel.resignFirstResponder()
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
        
        if currentBloodChoice == "الكل" {
            currentBloodChoice = "All"
        }
        
        sender.backgroundColor = OtherColor
        sender.layer.cornerRadius = sender.frame.height / 5
        sender.setTitleColor(MainColor, for: .normal)

    }
    
    var currentBloodChoice:String = "non"
    
    
    let dropDown = DropDown() //2

    
    let arrayCities = ["Amman", "Zarqa", "Irbid", "Aqaba", "Madaba", "Al Balqa", "Al Mafraq", "Ajloun"]
    
    let arrayCitiesAr = ["عمان", "الزرقاء", "اربد", "العقبة", "مادبا", "البلقاء", "المفرق", "عجلون"]

    
 
    
    let ammanHospitals = ["Medical Center (City)", "Abdali Hospital", "Abdulhadi Eye Hospital", "Al Ahli Hospital", "Al Bayader Hospital", "Al Khalidi Medical Center", "Al Maqased Hospital", "Al-Amal Hospital", "Al-Bashir Hospital", "Al-Essra Hospital", "King Hussein Cancer Center", "Almowasah Hospital", "The Farah Hospital", "Heba Hospital", "Ibn-Alhaytham Hospital", "The Islamic Hospital", "Istiklal Hospital", "Istishari Hospital", "The Italian Hospital", "Jabal Amman Hospital", "Jordan Hospital", "Jordan Red Crescent Hospital", "Jordan University Hospital", "Luzmila Hospital", "Malhas Hospital", "Marka Islamic Speciality Hospital", "Palestine Hospital", "Philadelphia Hospital", "Prince Hamzah Hospital", "Prince Rashid Hospital", "Shmaisani Hospital", "Speciality Hospital", "Tla' Al-Ali Hospital", "Other" ]
    
  
    let ammanHospitalsArabic = ["المدينة الطبية", "مستشفى العبدلي", "مستشفى عين عبدالهادي", "مستشفى الأهلي", "مستشفى البيادر", "مستشفى الخالدي", "مستشفى المقاصد", "مستشفى الأمل", "مستشفى البشير", "مستشفى الإسراء", "مستشفى الملك حسين للسرطان", "مستشفى المساواة", "مستشفى الفزح", "مستشفى هبا", "مستشفى ابن الهيثم", "المستشفى الإسلامي", "مستشفى الإستقلال", "مستشفى الإستشاري", "مستشفى الإيطالي", "مستشفي جبل عمان", "مستشفى الأردن", "مستشفى الصليب الأحمر", "مستشفى الجامعة الأردنية", "مستشفى لزيليما", "مستشفى ملحس", "مستشفى ماركا التخصصي الإسلامي", "مستشفى فلسطين", "مستشفى فيليدلفيا", "مستشفى الأمير حمزة", "مستشفى الأمير راشد", "مستشفى الشميساني", "مستشفى التخصصي", "مستشفى تلاع العلي", "آخر"]
    
    let ajlounHospitals = ["Al-Iman Hospital", "Princess Haya Military Hospital", "Other"]
    
    let ajlounHospitalsArabic = ["مستشفي ايمان", "مستشفى الأميرة هيا", "آخر"]

    
    let zarqaHospitals = ["Al Dalil Hospital", "Al-Hikma Modern Hospital", "Jabal Al Zaytoon Hospital", "Prince Faisal Hospital", "Zarqa Hospital", "Zarqa National Hospital", "Other"]
    
    let zarqaHospitalsArabic = ["مستشفى الدليل", "مستشفى الحكمة", "مستشفى جبل الزيتون", "مستشفى الأمير فيصل", "مستشفى الزرقاء", "مستشفى الزرقاء الوطني", "آخر"]
    
    let aqabaHospitals = ["The Islamic Hospital", "Aqaba Modern Hospital", "Other"]
    
    let aqabaHospitalsArabic = ["مستشفى الإسلامي", "مستشفى العقبة الجديد", "آخر"]
    
    
    let madabaHospitals = ["Al-Mahaba Hospital", "Al Nadeem Hospital", "Princess Salma Hospital", "Other"]
    
    let madabaHospitalsArabic = ["مستشفى المحبة", "مستشفى النديم", "مستشفى الأميرة سلمى", "آخر"]

    
    let irbidHospitals = ["Abu Obaida Hospital", "Al-Najah Hospital", "Al-Qawasmi Hospital", "Al-Ramtha Hospital", "Al-Yarmouk Hospital", "Ibn-Alnafees Hospital", "Irbid Islamic Hospital", "Irbid Speciality Hospital", "King Abdullah University Hospital", "Muaath Bin Jabal Hospital", "Princess Basma Hospital", "Princess Rahma Hospital", "Princess Raya Hospital", "Rahbat Al-Wardieh Hospital", "Other"]
    
    
    let irbidHospitalsArabic = ["مستشفى ابو عبيدة", "مستشفى النجاح", "مستشفى القواسمي", "مستشفى الرمثا", "مستشفى اليرموك", "مستشفى ابن النفيس", "مستشفى اربد الاسلامي", "مستشفى اربد التخصصي", "مستشفى جامعة الملك عبدالله", "مستشفى معاذ بن جبل", "مستشفى الأميرة بسمة", "مستشفى الأميرة بسمة", "مستشفى الأميرة رايا", "مستشفى راهبات الوردية", "آخر"]

    
    let albalqaHosiptals = ["Al-Rashid Hospital Center", "Princess Iman Hospital", "Other"]
    
    let albalqaHosiptalsArabic = ["مستشفى الرشيد", "مستشفى الأميرة ايمان", "آخر"]

    
    let almafraqHospitals = ["Al-Mafraq Hospital", "Al-Ruweished Hospital", "Other"]
    
    let almafraqHospitalsArabic = ["مستشفى المفرق", "مستشفى الرواشد", "آخر"]

    
    @IBAction func clickedCity(_ sender: Any) {
        firstNameLabel.resignFirstResponder()
        lastNameLabel.resignFirstResponder()
        if Manager.shared.isEnglish() == false{
            dropDown.dataSource = arrayCitiesAr//4

        }
        else{
            dropDown.dataSource = arrayCities//4

        }
        dropDown.anchorView = sender as! AnchorView //5
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
          dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self!.cityButton.setTitle(item, for: .normal) //9
            
            if Manager.shared.isEnglish() == false {
                self?.hospitalButton.setTitle("المستشفى", for: .normal)
            }
            else{
            self?.hospitalButton.setTitle("Hospital", for: .normal)
            }
            
            self?.otherTextField.isHidden = true
            self?.otherTextField.text = ""
          }
        
    }
    
    
    @IBAction func clickedHospitals(_ sender: Any) {
        firstNameLabel.resignFirstResponder()
        lastNameLabel.resignFirstResponder()
        var cityName = cityButton.currentTitle
        
       
       
        
        if cityName != "City" && cityName != "المدينة"{
            
            if Manager.shared.isEnglish() == false{
                cityName = Manager.shared.ArToEn[cityName!]

            }
            
            if Manager.shared.isEnglish() == true {
            switch cityName {
            case "Amman":
                dropDown.dataSource = ammanHospitals
            case "Zarqa":
                dropDown.dataSource = zarqaHospitals
            case "Irbid":
                dropDown.dataSource = irbidHospitals
            case "Madaba":
                dropDown.dataSource = madabaHospitals
            case "Aqaba":
                dropDown.dataSource = aqabaHospitals
            case "Al Balqa":
                dropDown.dataSource = albalqaHosiptals
            case "Al Mafraq":
                dropDown.dataSource = almafraqHospitals
            case "Ajloun":
                dropDown.dataSource = ajlounHospitals
            default:
                dropDown.dataSource = ammanHospitals

            }}
            else{
                switch cityName {
                case "Amman":
                    dropDown.dataSource = ammanHospitalsArabic
                case "Zarqa":
                    dropDown.dataSource = zarqaHospitalsArabic
                case "Irbid":
                    dropDown.dataSource = irbidHospitalsArabic
                case "Madaba":
                    dropDown.dataSource = madabaHospitalsArabic
                case "Aqaba":
                    dropDown.dataSource = aqabaHospitalsArabic
                case "Al Balqa":
                    dropDown.dataSource = albalqaHosiptalsArabic
                case "Al Mafraq":
                    dropDown.dataSource = almafraqHospitalsArabic
                case "Ajloun":
                    dropDown.dataSource = ajlounHospitalsArabic
                default:
                    dropDown.dataSource = ammanHospitalsArabic

                }
            }
            
            
            
            
            
            
            
        dropDown.anchorView = sender as! AnchorView //5
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
          dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self!.hospitalButton.setTitle(item, for: .normal) //9
            if item == "Other" || item == "آخر" {
                self!.otherTextField.isHidden = false
            }
            else{
                self!.otherTextField.isHidden = true

            }
          }
        }
        else{
            if Manager.shared.isEnglish() == true {

                errorLabel.text = "Choose city"}
            
            else{
                
                errorLabel.text = "اختر المدينة"}
            errorLabel.isHidden = false
            errorLabel.shake()
        }
        
    }
    
    
    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        if firstNameLabel.text?.isEmpty == false && lastNameLabel.text?.isEmpty == false && currentBloodChoice != "non" && cityButton.currentTitle != "City" && hospitalButton.currentTitle != "Hospital" && cityButton.currentTitle != "المدينة" && hospitalButton.currentTitle != "المستشفى"
        {
            if hospitalButton.currentTitle == "Other" || hospitalButton.currentTitle == "آخر" {
                if otherTextField.text?.isEmpty == false {
                    if Manager.shared.isEnglish() == true {
                        showError(title: "Error", error: "No Internet Conection", WOAH: "Try Again")}
                    else{
                        showError(title: "مشكلة", error: "تأكد من وجود شبكة انترنت", WOAH: "حاول مجدداً")}

                }
                else{
                    if Manager.shared.isEnglish() == true {
                        errorLabel.text = "Enter hospital name"}
                    else{
                        errorLabel.text = "ادخل اسم المدستشفى"
                    }
                    errorLabel.isHidden = false
                    errorLabel.shake()
                }
            }
            else{
                
                if Manager.shared.isEnglish() == true {
                    showError(title: "Error", error: "No Internet Conection", WOAH: "Try Again")}
                else{
                    showError(title: "مشكلة", error: "تأكد من وجود شبكة انترنت", WOAH: "حاول مجدداً")}



            }
            // success and continue
            
        }
        
        else{
            
            
            if firstNameLabel.text?.isEmpty == true
            {
                if Manager.shared.isEnglish() == true {
                    errorLabel.text = "Enter your first name"}
                else{
                    
                    errorLabel.text = "ادخل اسمك الأول"}
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if lastNameLabel.text?.isEmpty == true
            {
                if Manager.shared.isEnglish() == true {
                    errorLabel.text = "Enter your first name"}
                else{
                    
                    errorLabel.text = "ادخل اسمك الأخير"
                }
                errorLabel.isHidden = false
                errorLabel.shake()
            }

            else if cityButton.currentTitle == "City" || cityButton.currentTitle == "المدينة"
            {
                if Manager.shared.isEnglish() == true {
                    errorLabel.text = "Choose your city"}
                else{
                    
                    errorLabel.text = "اختر مدينتك"
                }
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if hospitalButton.currentTitle == "Hospital" || hospitalButton.currentTitle == "المستشفى"
            {
                if Manager.shared.isEnglish() == true {
                    errorLabel.text = "Choose your hospital"}
                else{
                    
                    errorLabel.text = "اختر المستشفى"
                }
                errorLabel.isHidden = false
                errorLabel.shake()
            }
            else if currentBloodChoice == "non" {
                if Manager.shared.isEnglish() == true {
                    errorLabel.text = "Choose the blood type needed"}
                else{
                    
                    errorLabel.text = "اختر الدم المراد"
                }
                    errorLabel.isHidden = false
                errorLabel.shake()
            }
            
            
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinal" {
            let destinationVC = segue.destination as! SubmitViewController
            destinationVC.firstNameVar = String((firstNameLabel.text?.prefix(12))!).trimmingCharacters(in: .whitespacesAndNewlines)
            destinationVC.lastNameVar = String((lastNameLabel.text?.prefix(12))!).trimmingCharacters(in: .whitespacesAndNewlines)
            
            if Manager.shared.isEnglish() == false {
                destinationVC.cityVar = Manager.shared.ArToEn[cityButton.currentTitle!]
                
                if hospitalButton.currentTitle == "Other" || hospitalButton.currentTitle == "آخر" {
                    destinationVC.hospitalNameVar = String((otherTextField.text?.prefix(30))!).trimmingCharacters(in: .whitespacesAndNewlines)
                }
                else{
                    destinationVC.hospitalNameVar =  Manager.shared.hodpitals[Manager.shared.hospitalsArabic.firstIndex(of: hospitalButton.currentTitle!)!]}
                
            
                print("HAYO\(Manager.shared.hodpitals[Manager.shared.hospitalsArabic.firstIndex(of: hospitalButton.currentTitle!)!])")


            }
            else{
                destinationVC.cityVar = cityButton.currentTitle!
                
                if hospitalButton.currentTitle == "Other" || hospitalButton.currentTitle == "آخر" {
                    destinationVC.hospitalNameVar = otherTextField.text
                }
                else{
                    destinationVC.hospitalNameVar = hospitalButton.currentTitle!}


            }
            
            destinationVC.bloodType = currentBloodChoice

        }
    }

}
