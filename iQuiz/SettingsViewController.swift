//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Omar Rayyan on 09/04/2021.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var reportProblem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Manager.shared.isEnglish() == false {
            notiLabel.text = "لتشغيل أو إطفاء الإشعارات توجه للإعدادات"
            titleLabel.text = "الإعدادات"
            aboutButton.setTitle("عن قطرة", for: .normal)
            aboutButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
            titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
            reportProblem.setTitle("الإبلاغ عن مشكلة", for: .normal)
            reportProblem.titleLabel!.font = UIFont(name: "Avenir Heavy", size: 19)
            doneButton.titleLabel!.font = UIFont(name: "Avenir Heavy", size: 19)
            doneButton.setTitle("استمرار", for: .normal)
        }
        else{
            notiLabel.text = "to toggle notifications head to settings"

            titleLabel.text = "Settings"
            titleLabel.font = UIFont(name: "Futura Bold", size: 50)
            aboutButton.setTitle("About Qatra" , for: .normal)
            aboutButton.titleLabel?.font = UIFont(name: "Futura Medium", size: 19)
            reportProblem.setTitle("Report a problem", for: .normal)
            reportProblem.titleLabel!.font = UIFont(name: "Futura Medium", size: 19)
            doneButton.titleLabel!.font = UIFont(name: "Futura Bold", size: 19)
            doneButton.setTitle("Done", for: .normal)
            
            
            
        }
        aboutButton.layer.cornerRadius = aboutButton.frame.height / 7
        doneButton.layer.cornerRadius = doneButton.frame.height / 7
        languageButton.layer.cornerRadius = languageButton.frame.height / 7
        reportProblem.layer.cornerRadius = reportProblem.frame.height / 7

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if Manager.shared.kante == true{
            Manager.shared.kante = false
            if Manager.shared.isEnglish() == false {
                notiLabel.text = "لتشغيل أو إطفاء الإشعارات توجه للإعدادات"
                aboutButton.setTitle("عن قطرة", for: .normal)
                aboutButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 19)
                titleLabel.text = "الإعدادات"
                titleLabel.font = UIFont(name: "Avenir Heavy", size: 50)
                reportProblem.setTitle("الإبلاغ عن مشكلة", for: .normal)
                reportProblem.titleLabel!.font = UIFont(name: "Avenir Heavy", size: 19)
                doneButton.titleLabel!.font = UIFont(name: "Avenir Heavy", size: 19)
                doneButton.setTitle("استمرار", for: .normal)
            }
            else{
                notiLabel.text = "to toggle notifications head to settings"
                aboutButton.setTitle("About Qatra" , for: .normal)
                aboutButton.titleLabel?.font = UIFont(name: "Futura Medium", size: 19)
                titleLabel.text = "Settings"
                titleLabel.font = UIFont(name: "Futura Bold", size: 50)
                reportProblem.setTitle("Report a problem", for: .normal)
                reportProblem.titleLabel!.font = UIFont(name: "Futura Medium", size: 19)
                doneButton.titleLabel!.font = UIFont(name: "Futura Bold", size: 19)
                doneButton.setTitle("Done", for: .normal)
                
                
                
            }
        }
        
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    
    @IBAction func reportPressed(_ sender: Any) {
        if Manager.shared.isEnglish() == true {
            sendEmail(subject: "Reporting a problem in Qatra")}
        else {
            sendEmail(subject: "الإبلاغ عن مشكلة في تطبيق قطرة")
        }
       
        
    

    }
    
    
    
    @IBOutlet weak var notiLabel: UILabel!
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
      controller.dismiss(animated: true)
    }
    
    @IBAction func clickedChange(_ sender: Any) {
        
        
        performSegue(withIdentifier: "toLann", sender: self)
        
//
//        let actionSheet = UIAlertController(title: "Restart", message: "Are you sure you want to restart the app language? The app will forcefully close", preferredStyle: .actionSheet)
//
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        actionSheet.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: { _ in
//
//            UserDefaults.standard.setValue(nil, forKey: "Language")
//           // restart app
//            fatalError()
//
//
//                }
//
//
//
//        ))
//        actionSheet.popoverPresentationController?.sourceView = self.view
//        actionSheet.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
//        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//
//        present(actionSheet, animated: true)

    }
    
    func sendEmail(subject: String) {
      if MFMailComposeViewController.canSendMail() {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["omarayyanapps@hotmail.com"])
        mail.setSubject(subject)
        mail.setMessageBody("", isHTML: false)
        present(mail, animated: true)
      } else {
        // show failure alert
      }
    }

}
