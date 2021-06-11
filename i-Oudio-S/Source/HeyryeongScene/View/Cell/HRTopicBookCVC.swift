//
//  HRTopicBookCVC.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import UIKit

class HRTopicBookCVC: UICollectionViewCell {

    static let identifier = "HRTopicBookCVC"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(){
        topicLabel.textColor = UIColor.mainGray1
        topicLabel.font = UIFont.myMediumSystemFont(ofSize: 12)
    }
    
    
    func setContent(book: TopicBookData){
        imageView.image = UIImage(named: book.imageName)
        topicLabel.text = book.topic
    }

}
