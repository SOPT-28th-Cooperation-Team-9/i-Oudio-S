//
//  HeaderTVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit

class HeaderTVC: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var separateLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor(red: (33 / 255), green: (33 / 255), blue: (33 / 255), alpha: 1.0)
        separateLine.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(headerImage: String,
                 title: String,
                 author: String,
                 subTitle: String) {
        if let image = UIImage(named: headerImage) {
            headerImageView.image = image
        }
        titleLabel.text = title
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 19)
        authorLabel.text = author
        authorLabel.font = UIFont.myRegularSystemFont(ofSize: 12)
        subTitleLabel.text = subTitle
        subTitleLabel.font = UIFont.myBoldSystemFont(ofSize: 14)
        
        subTitleLabel.sizeToFit()
    }
    
}
