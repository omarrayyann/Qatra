//
//  ViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit
import FirebaseFirestore

protocol MyCustomCellDelegator {
    func callSegueFromCell(name: String, place: String, phone: String, note: String, bloodType: String, time: String)}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCustomCellDelegator {
    func callSegueFromCell(name: String, place: String, phone: String, note: String, bloodType: String, time: String) {
        
        
        nameCurrent = name
        placeCurrent = place
        phoneCurrent = phone
        noteCurrent = note
        bloodCurrent = bloodType
        timeCurrent = time
        
        print("koko\(nameCurrent)")
        
        performSegue(withIdentifier: "toProfile", sender: self)

        
    }
    
    var nameCurrent = ""
    var placeCurrent = ""
    var phoneCurrent = ""
    var noteCurrent = ""
    var bloodCurrent = ""
    var timeCurrent = ""

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile" {
            let destinationVC = segue.destination as! MoreViewController
            destinationVC.nameVar = nameCurrent
            destinationVC.locationVar = placeCurrent
            destinationVC.phoneVar = phoneCurrent
            destinationVC.noteVar = noteCurrent
            destinationVC.bloodVar = "Blood Type: \(bloodCurrent)"
            destinationVC.timeVar = timeCurrent

        }
    }
    
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var posts: [String] = []
    
    
    
    func loadPosts(){
        indicator.isHidden = false
        db.collection("Requests").document("requests").getDocument { (snapshot, error) in
            if let e = error {
                print(e)
            }
            else{
                self.posts = snapshot?.data()!["requestsArray"] as! [String]
                self.indicator.isHidden = true
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let current = Array(posts[indexPath.row])
   
        
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
            
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCells", for: indexPath) as! HomeFeedUtTableViewCell
        cell.cityName.text = cityName
        cell.locationHospital.text = hospitalName
//        cell.timeLabel.text = Double(timeInterval)
        cell.NameLabelHidden.text = "\(firstName) \(lastName)"
        cell.bloodType.text = "\(bloodName)"
        cell.noteLabel.text = "\(extraName)"
        cell.phoneLabel.text = phone
        
        let dateNow = NSDate() as Date

        let dateOfTime = Date(timeIntervalSince1970: Double(timeInterval)!)
        
        cell.timeLabel.text = dateNow.timeSinceDate(fromDate: dateOfTime)
        cell.row = indexPath.row
        

        cell.delegate = self
        
        return cell
    }
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelBlood: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeFeedUtTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCells" )
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.labelBlood.text = "My Blood Type: \(UserDefaults.standard.string(forKey: "bloodType") ?? " ")"

        
        }
        // Do any additional setup after loading the view.
    }
    
    var doIt = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if UserDefaults.standard.string(forKey: "bloodType") == nil {
            performSegue(withIdentifier: "toFirst", sender: self)
        }
    }


}

