//
//  DetailAudioTVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/21.
//

import UIKit

class DetailAudioTVC: UITableViewCell {

    static let identifier = "DetailAudioTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        titleLabel.text = "데미안 02_두 세계"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 14)
        
        timeLabel.text = "5분 샘플 5분"
        timeLabel.textColor = UIColor.mainGray1
        timeLabel.font = UIFont.myMediumSystemFont(ofSize: 11)
    }
    
}
