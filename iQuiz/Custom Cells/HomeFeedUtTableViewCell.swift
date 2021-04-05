//
//  HomeFeedUtTableViewCell.swift
//  iQuiz
//
//  Created by Omar Rayyan on 05/04/2021.
//

import UIKit

class HomeFeedUtTableViewCell: UITableViewCell {

    var row: Int?

    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var NameLabelHidden: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var locationHospital: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var contributeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contributeButton.layer.cornerRadius = contributeButton.frame.height / 5
      
        // Initialization code
    }
    var delegate:MyCustomCellDelegator!

    @IBAction func contributePressed(_ sender: Any) {
        if(self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(name: NameLabelHidden.text!, place: "\(locationHospital.text!) in \(cityName.text!)", phone: phoneLabel.text!, note: noteLabel.text!, bloodType: bloodType.text!, time: timeLabel.text!)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
