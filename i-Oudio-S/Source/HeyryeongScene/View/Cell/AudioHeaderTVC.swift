//
//  AudioHeaderTVC.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import UIKit

class AudioHeaderTVC: UITableViewCell {

    static let identifier = "AudioHeaderTVC"
    
    @IBOutlet weak var audioTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var seperatorLineView: UIView!
    
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
        audioTitleLabel.textColor = UIColor.white
        audioTitleLabel.font = UIFont.myBoldSystemFont(ofSize: 26)
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 19)
        titleLabel.numberOfLines = 0
        titleLabel.text = "'유퀴즈' 출연 김범석 의사의\n<어떤 죽음이 삶에게 말했다>"
        
        authorLabel.textColor = UIColor.white
        authorLabel.font = UIFont.myRegularSystemFont(ofSize: 12)
        authorLabel.numberOfLines = 0
        authorLabel.text = "김범석 저\n김범석 낭독"
        
        contentsLabel.textColor = UIColor.white
        contentsLabel.font = UIFont.myBoldSystemFont(ofSize: 14)
        contentsLabel.text = "오늘만 무료! '수요 오디오 책방'"
        
        seperatorLineView.backgroundColor = UIColor.mainClearWhite
        
    }
    
}
