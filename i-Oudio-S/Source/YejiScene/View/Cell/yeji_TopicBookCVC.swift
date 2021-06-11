//
//  TopicBookCVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/22.
//

import UIKit

class yeji_TopicBookCVC: UICollectionViewCell {

    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var topicName: UILabel! {
        didSet {
            topicName.font = UIFont.myMediumSystemFont(ofSize: 12)
            topicName.textColor = .mainGray1
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(topicImage: String,
                 topic: String) {
        if let image = UIImage(named: topicImage) {
            topicImageView.image = image
        }
        topicName.text = topic
    }
}
