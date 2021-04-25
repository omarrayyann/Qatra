//
//  Manager.swift
//  iQuiz
//
//  Created by Omar Rayyan on 08/04/2021.
//

import Foundation


public class Manager {
    
    
    public static var shared = Manager()
    
    var filterCities = "All"
    
    var filterBloods = "All"
    
    var butter = false
    
    var changed = true
    
    var changedWOW = false
    
    var kante = false

    
    var doIt = true
    
    func isEnglish() -> Bool {
        
        if UserDefaults.standard.string(forKey: "Language") == "En" {
            return true
        }
        else{
            return false
        }
        
    }
    
    
    
    
    
    
    var ArToEn: [String:String] = [:]
    
    func fill(){
    ArToEn["عجلون"] = "Ajloun"
    ArToEn["المفرق"] = "Al Mafraq"
    ArToEn["البلقاء"] = "Al Balqa"
    ArToEn["مادبا"] = "Madaba"
    ArToEn["العقبة"] = "Aqaba"
    ArToEn["اربد"] = "Irbid"
    ArToEn["الزرقاء"] = "Zarqa"
    ArToEn["عمان"] = "Amman"
    EnToAr["Ajloun"] = "عجلون"
    EnToAr["Al Mafraq"] = "المفرق"
    EnToAr["Al Balqa"] = "البلقاء"
    EnToAr["Madaba"] = "مادبا"
    EnToAr["Aqaba"] = "العقبة"
    EnToAr["Irbid"] = "اربد"
    EnToAr["Zarqa"] = "الزرقاء"
    EnToAr["Amman"] = "عمان"
    }
    
    var EnToAr: [String:String] = [:]
    
 
    
    let hodpitals = ["Medical Center (City)", "Abdali Hospital", "Abdulhadi Eye Hospital", "Al Ahli Hospital", "Al Bayader Hospital", "Al Khalidi Medical Center", "Al Maqased Hospital", "Al-Amal Hospital", "Al-Bashir Hospital", "Al-Essra Hospital", "King Hussein Cancer Center", "Almowasah Hospital", "The Farah Hospital", "Heba Hospital", "Ibn-Alhaytham Hospital", "The Islamic Hospital", "Istiklal Hospital", "Istishari Hospital", "The Italian Hospital", "Jabal Amman Hospital", "Jordan Hospital", "Jordan Red Crescent Hospital", "Jordan University Hospital", "Luzmila Hospital", "Malhas Hospital", "Marka Islamic Speciality Hospital", "Palestine Hospital", "Philadelphia Hospital", "Prince Hamzah Hospital", "Prince Rashid Hospital", "Shmaisani Hospital", "Speciality Hospital", "Tla' Al-Ali Hospital", "Other", "Al-Iman Hospital", "Princess Haya Military Hospital", "Other", "Al Dalil Hospital", "Al-Hikma Modern Hospital", "Jabal Al Zaytoon Hospital", "Prince Faisal Hospital", "Zarqa Hospital", "Zarqa National Hospital", "Other", "The Islamic Hospital", "Aqaba Modern Hospital", "Other", "Al-Mahaba Hospital", "Al Nadeem Hospital", "Princess Salma Hospital", "Other", "Abu Obaida Hospital", "Al-Najah Hospital", "Al-Qawasmi Hospital", "Al-Ramtha Hospital", "Al-Yarmouk Hospital", "Ibn-Alnafees Hospital", "Irbid Islamic Hospital", "Irbid Speciality Hospital", "King Abdullah University Hospital", "Muaath Bin Jabal Hospital", "Princess Basma Hospital", "Princess Rahma Hospital", "Princess Raya Hospital", "Rahbat Al-Wardieh Hospital", "Other", "Al-Rashid Hospital Center", "Princess Iman Hospital", "Other", "Al-Mafraq Hospital", "Al-Ruweished Hospital", "Other", "koko"]
    

    
    let hospitalsArabic = ["المدينة الطبية", "مستشفى العبدلي", "مستشفى عين عبدالهادي", "مستشفى الأهلي", "مستشفى البيادر", "مستشفى الخالدي", "مستشفى المقاصد", "مستشفى الأمل", "مستشفى البشير", "مستشفى الإسراء", "مستشفى الملك حسين للسرطان", "مستشفى المساواة", "مستشفى الفزح", "مستشفى هبا", "مستشفى ابن الهيثم", "المستشفى الإسلامي", "مستشفى الإستقلال", "مستشفى الإستشاري", "مستشفى الإيطالي", "مستشفي جبل عمان", "مستشفى الأردن", "مستشفى الصليب الأحمر", "مستشفى الجامعة الأردنية", "مستشفى لزيليما", "مستشفى ملحس", "مستشفى ماركا التخصصي الإسلامي", "مستشفى فلسطين", "مستشفى فيليدلفيا", "مستشفى الأمير حمزة", "مستشفى الأمير راشد", "مستشفى الشميساني", "مستشفى التخصصي", "مستشفى تلاع العلي", "آخر", "مستشفي ايمان", "مستشفى الأميرة هيا", "آخر", "مستشفى الدليل", "مستشفى الحكمة", "مستشفى جبل الزيتون", "مستشفى الأمير فيصل", "مستشفى الزرقاء", "مستشفى الزرقاء الوطني", "آخر", "مستشفى الإسلامي", "مستشفى العقبة الجديد", "آخر", "مستشفى المحبة", "مستشفى النديم", "مستشفى الأميرة سلمى", "آخر", "مستشفى ابو عبيدة", "مستشفى النجاح", "مستشفى القواسمي", "مستشفى الرمثا", "مستشفى اليرموك", "مستشفى ابن النفيس", "مستشفى اربد الاسلامي", "مستشفى اربد التخصصي", "مستشفى جامعة الملك عبدالله", "مستشفى معاذ بن جبل", "مستشفى الأميرة بسمة", "مستشفى الأميرة بسمة", "مستشفى الأميرة رايا", "مستشفى راهبات الوردية", "آخر", "مستشفى الرشيد", "مستشفى الأميرة ايمان", "آخر", "مستشفى المفرق", "مستشفى الرواشد", "آخر"]
    
    

 
    
}
