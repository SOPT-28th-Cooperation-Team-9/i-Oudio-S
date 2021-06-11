//
//  DetailHeaderCVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/21.
//

import UIKit
import Kingfisher

class DetailHeaderCVC: UICollectionViewCell {
    
    static let identifier: String = "DetailHeaderCVC"

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishLabel: UILabel!
    @IBOutlet weak var playNumberLabel: UILabel!
    
    @IBOutlet weak var sampleButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    func setContent(book: BasicBookData){
        bookImageView.image = UIImage(named: book.imageName)
        titleLabel.text = book.title
        authorLabel.text = book.author
        publishLabel.text = "민음사"
        playNumberLabel.text = "81,614"
        setUI()
    }
    
    func setContent(book: BookDataModel){
        bookImageView.kf.setImage(with: URL(string: book.bookImage))
        //bookImageView.image = UIImage(named: book.bookImage)
        titleLabel.text = book.bookTitle
        authorLabel.text = book.author
        publishLabel.text = "민음사"
        playNumberLabel.text = "81,614"
        setUI()
    }
    
    func setUI(){
        sampleButton.tintColor = UIColor.white
        sampleButton.backgroundColor = UIColor.mainPurpule
        sampleButton.titleLabel?.font = UIFont.myMediumSystemFont(ofSize: 12)
        sampleButton.layer.borderWidth = 1.0
        sampleButton.layer.cornerRadius = 3
        
        heartButton.layer.borderWidth = 1.0
        heartButton.layer.borderColor = UIColor.mainGray1.cgColor
        heartButton.layer.cornerRadius = 3
        
        shareButton.layer.borderWidth = 1.0
        shareButton.layer.borderColor = UIColor.mainGray1.cgColor
        shareButton.layer.cornerRadius = 3
        
    }
}
