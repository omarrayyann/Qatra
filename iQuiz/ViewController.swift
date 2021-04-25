//
//  ViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 04/04/2021.
//

import UIKit
import FirebaseFirestore
import UICheckbox
import BonsaiController

protocol MyCustomCellDelegator {
    func callSegueFromCell(name: String, place: String, phone: String, note: String, bloodType: String, time: String)}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCustomCellDelegator {
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
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
        if segue.destination is ViewController {
            segue.destination.transitioningDelegate = self
            segue.destination.modalPresentationStyle = .custom
        }
        
        if segue.identifier == "toProfile" {
            let destinationVC = segue.destination as! MoreViewController
            destinationVC.nameVar = nameCurrent
            destinationVC.locationVar = placeCurrent
            destinationVC.phoneVar = phoneCurrent
            destinationVC.noteVar = noteCurrent
            if Manager.shared.isEnglish() == true {
                destinationVC.bloodVar = "Blood Type Needed: \(bloodCurrent)"}
            else{
                destinationVC.bloodVar = "فصيلة الدم المرادة: \(bloodCurrent)"}

            destinationVC.timeVar = timeCurrent

        }
    }
    
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var posts: [String] = []
    
    
    
    func loadPosts(bloodType: String, cityType: String){
        posts = []
        tableView.reloadData()
        indicator.isHidden = false
        db.collection("Requests").document("requests").getDocument { [self] (snapshot, error) in
            if let e = error {
                print(e)
                self.refreshControl.endRefreshing()

            }
            else{
                if bloodType == "All" && cityType == "All" {
                self.posts = snapshot?.data()!["requestsArray"] as! [String]
                self.indicator.isHidden = true
                self.posts.reverse()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                }
                else if bloodType == "All" && cityType == "Yours" {
                    var postie = snapshot?.data()!["requestsArray"] as! [String]
                    
                    for posti in postie {
                        if posti.contains(UserDefaults.standard.string(forKey: "city")!) == true {
                            posts.append(posti)
                        }
                    }
                    
                    self.indicator.isHidden = true
                    self.posts.reverse()
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()

                    }
                else if bloodType == "Yours" && cityType == "All" {
                    var postie = snapshot?.data()!["requestsArray"] as! [String]
                    
                    if UserDefaults.standard.string(forKey: "bloodType")! == "N/A" {
                        posts = postie
                    }
                    else{
                    for posti in postie {
                        if posti.contains(UserDefaults.standard.string(forKey: "bloodType")!) == true || posti.contains("%k9kAll%k9k") == true{
                            posts.append(posti)
                        }
                    }
                    }
                    self.refreshControl.endRefreshing()

                    self.indicator.isHidden = true
                    self.posts.reverse()
                    self.tableView.reloadData()
                    }
                else if bloodType == "Yours" && cityType == "Yours" {
                    var postie = snapshot?.data()!["requestsArray"] as! [String]
                    
                    
                    if UserDefaults.standard.string(forKey: "bloodType")! == "N/A" {

                        for posti in postie {
                            if posti.contains(UserDefaults.standard.string(forKey: "city")!) == true {
                                posts.append(posti)
                            }
                        }
                        
                    }
                    
                    else{
                    
                    for posti in postie {
                        if posti.contains(UserDefaults.standard.string(forKey: "city")!) == true && (posti.contains(UserDefaults.standard.string(forKey: "bloodType")!) == true || posti.contains("%k9kAll%k9k") == true) {
                            posts.append(posti)
                        }
                    }
                        
                    }
                    
                    
                    self.refreshControl.endRefreshing()
                    self.indicator.isHidden = true
                    self.posts.reverse()
                    self.tableView.reloadData()
                    }
                
                
                
                
                
                
                
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
        
        
        var unitsInterval: String = ""
        var unitsIntervalDone: Bool = false
        
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
            
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCells", for: indexPath) as! HomeFeedUtTableViewCell
        Manager.shared.fill()
        if Manager.shared.isEnglish() == false {
            
            
            cell.contributeButton.setTitle("ساهم الآن", for: .normal)
            cell.contributeButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 17)
            cell.cityName.text = Manager.shared.EnToAr[cityName]
            
            
            if Manager.shared.isEnglish() == true {
                cell.locationHospital.text = hospitalName
                
            }
            else{
                cell.locationHospital.text = Manager.shared.hospitalsArabic[Manager.shared.hodpitals.firstIndex(of: hospitalName) ?? 71]
                
                if cell.locationHospital.text == "آخر" {
                    cell.locationHospital.text = hospitalName
                }
                
                
            }    //        cell.timeLabel.text = Double(timeInterval)
            
            if unitsInterval == "1" {
                cell.NameLabelHidden.text = "جرعة واحدة"}

            else{
                if unitsInterval == "2" {
                    
                    cell.NameLabelHidden.text = "جرعتين"}
                else{
                    
                    if Int(unitsInterval)! > 10 {
                        
                        cell.NameLabelHidden.text = "\(unitsInterval) جرعة"}
                    else{

                
                cell.NameLabelHidden.text = "\(unitsInterval) جرعات"}
                }
            }


            cell.bloodType.text = "\(bloodName)"
            
            if bloodName == "All"  {
                cell.bloodType.text = "الكل"
                cell.bloodType.font = UIFont(name: "Avenir Heavy", size: 18)

            }
            else{
                cell.bloodType.text = "\(bloodName)"
                cell.bloodType.font = UIFont(name: "Futura Bold", size: 17)

            }
            
            cell.noteLabel.text = "\(extraName)"
            cell.phoneLabel.text = phone
            cell.unitsLabel.text = "من \(firstName) \(lastName)"

        }
        else{
            
            cell.contributeButton.setTitle("contribute now", for: .normal)
            cell.contributeButton.titleLabel?.font = UIFont(name: "Futura Medium", size: 15)
            cell.cityName.text = cityName
            
            
            
            if Manager.shared.isEnglish() == true {
                cell.locationHospital.text = hospitalName
                
            }
            else{
                
                cell.locationHospital.text = Manager.shared.hospitalsArabic[Manager.shared.hodpitals.firstIndex(of: hospitalName) ?? 71]
                
                if cell.locationHospital.text == "آخر" {
                    cell.locationHospital.text = hospitalName
                }
                
                
                
                
                
            }
            
            if unitsInterval != "1" {

            
                cell.unitsLabel.text = "\(unitsInterval) units"
                
            }
            
            else{
                cell.unitsLabel.text = "\(unitsInterval) unit"

            }

            
            
            
            
//        cell.timeLabel.text = Double(timeInterval)
        cell.NameLabelHidden.text = "by \(firstName) \(lastName)"
        cell.bloodType.text = "\(bloodName)"
        cell.noteLabel.text = "\(extraName)"
        cell.phoneLabel.text = phone
        cell.bloodType.font = UIFont(name: "Futura Bold", size: 17)

            
                    }
        
        let dateNow = NSDate() as Date

        let dateOfTime = Date(timeIntervalSince1970: Double(timeInterval)!)
        
        cell.timeLabel.text = dateNow.timeSinceDate(fromDate: dateOfTime)
        cell.row = indexPath.row
        

        cell.delegate = self
        
        return cell
    }
    
    
    @IBAction func refreshPressed(_ sender: Any) {
        loadPosts(bloodType: Manager.shared.filterBloods, cityType: Manager.shared.filterCities)
    }
    
    @objc private func refreshFeed(_ sender: Any) {
        // Fetch Weather Data
        posts = []
        loadPosts(bloodType: Manager.shared.filterBloods, cityType: Manager.shared.filterCities)
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelBlood: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.shared.fill()
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor(named: "OtherColor")
        refreshControl.addTarget(self, action: #selector(refreshFeed(_:)), for: .valueChanged)
        
        if Manager.shared.isEnglish() == false {
            self.labelBlood.text = " :\("نوع الدم")"
            print("CHACHA")
            self.cityLabel.text = "\("المدينة"): "
            self.labelBlood.font = UIFont(name: "Avenir Heavy", size: 17)
            self.cityLabel.font = UIFont(name: "Avenir Heavy", size: 17)

        }
        
        if Manager.shared.isEnglish() == false{
            titleLabel.text = "الطلبات الحالية"
            titleLabel.font = UIFont(name: "Avenir Heavy", size: 25)

        }
        else{
            titleLabel.text = "Current Requests"
            titleLabel.font = UIFont(name: "Futura Medium", size: 25)

        }
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [self] timer in
            if UserDefaults.standard.string(forKey: "Language") != nil && Manager.shared.changed == true && UserDefaults.standard.string(forKey: "city") != nil {
                Manager.shared.changed = false
                
                if Manager.shared.isEnglish() == false{
                    titleLabel.text = "الطلبات الحالية"
                    titleLabel.font = UIFont(name: "Avenir Heavy", size: 25)

                }
                else{
                    titleLabel.text = "Current Requests"
                    titleLabel.font = UIFont(name: "Futura Medium", size: 25)
                }
                
        
        loadPosts(bloodType: Manager.shared.filterBloods, cityType: Manager.shared.filterCities)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeFeedUtTableViewCell", bundle: nil), forCellReuseIdentifier: "homeCells" )
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            
            if Manager.shared.isEnglish() == false {
                self.labelBlood.text = "\(UserDefaults.standard.string(forKey: "bloodType") ?? " ") :\("نوع الدم")"
                self.cityLabel.text = "\("المدينة"): \(Manager.shared.EnToAr[UserDefaults.standard.string(forKey: "city")!] ?? " ")"
                self.labelBlood.font = UIFont(name: "Avenir Heavy", size: 17)
                self.cityLabel.font = UIFont(name: "Avenir Heavy", size: 17)

            }
            else{
            self.labelBlood.text = "My Blood Type: \(UserDefaults.standard.string(forKey: "bloodType") ?? " ")"
            self.cityLabel.text = "My City: \(UserDefaults.standard.string(forKey: "city") ?? " ")"
                self.labelBlood.font = UIFont(name: "Futura Medium", size: 14)
                self.cityLabel.font = UIFont(name: "Futura Medium", size: 14)
            }
            
            
//            self.labelCity.text = "City: \(UserDefaults.standard.string(forKey: "city") ?? " ")"

            
          
            
          
                
            
            
        }
         

        }
            
        }
        // Do any additional setup after loading the view.
    }
    
    var doIt = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      
        if UserDefaults.standard.string(forKey: "sawTot") != "seen"{
            performSegue(withIdentifier: "toTot", sender: self)
        }
        else if UserDefaults.standard.string(forKey: "Language") == nil {
            performSegue(withIdentifier: "toLan", sender: self)
        }
        else if UserDefaults.standard.string(forKey: "city") == nil {
            performSegue(withIdentifier: "toFirst", sender: self)
        }
        

        
    }

    @IBAction func filterClicked(_ sender: Any) {
        
        
        if Manager.shared.isEnglish() == true {
            let smallVC = storyboard!.instantiateViewController(identifier: "SmallVC")
            smallVC.transitioningDelegate = self
            smallVC.modalPresentationStyle = .custom
            present(smallVC, animated: true, completion: nil )
        }
        else if Manager.shared.isEnglish() == false {
            let smallVC = storyboard!.instantiateViewController(identifier: "SmallVCArabic")
            smallVC.transitioningDelegate = self
            smallVC.modalPresentationStyle = .custom
            present(smallVC, animated: true, completion: nil )

        }
        
        
    }
    
  
    
}

extension ViewController: BonsaiControllerDelegate {
    
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        
        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / (4/3)))
    }
    
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    
        /// With Background Color ///
    
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .bottom, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
        //return BonsaiController(fromView: yourOriginView, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
    
    
        /// With Blur Style ///
        
        // Slide animation from .left, .right, .top, .bottom
        //return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
        //return BonsaiController(fromView: yourOriginView, blurEffectStyle: .dark,  presentedViewController: presented, delegate: self)
    }
}
