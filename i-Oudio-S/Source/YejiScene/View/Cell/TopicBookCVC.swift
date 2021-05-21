//
//  TopicBook.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/19.
//

import UIKit

class TopicBookCVC: UICollectionViewCell {
    
    @IBOutlet weak var topicImageButton: UIButton!
    @IBOutlet weak var topicLabel: UILabel! {
        didSet {
            topicLabel.font = UIFont.myRegularSystemFont(ofSize: 12)
            topicLabel.textColor = .mainGray1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(topicImage: String,
                 topic: String) {
    
        if let image = UIImage(named: topicImage) {
            topicImageButton.setImage(image, for: .normal)
        }
        topicLabel.text = topic
        
    }

}
