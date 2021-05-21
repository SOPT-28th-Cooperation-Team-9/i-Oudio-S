//
//  SNSBookCVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/18.
//

import UIKit

class SNSSaleBookCVC: UICollectionViewCell {
    
    static let identifier = "SNSSaleBookCVC"

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }
    
    func setContentData(book: BasicBookData){
        bookImageView.image = UIImage(named: book.imageName)
        titleLabel.text = book.title
        authorLabel.text = book.author
        priceLabel.text = "대여 \(book.price)원"
    }
    
    func setUI(){
        cellTitleLabel.textColor = UIColor.mainPurpule
        cellTitleLabel.font = UIFont.myBoldSystemFont(ofSize: 13)
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myMediumSystemFont(ofSize: 13)
        
        authorLabel.numberOfLines = 2
        authorLabel.textColor = UIColor.mainGray1
        authorLabel.font = UIFont.myMediumSystemFont(ofSize: 11)
        
        priceLabel.textColor = UIColor.white
        priceLabel.font = UIFont.myMediumSystemFont(ofSize: 11)
        
        detailButton.titleLabel?.font = UIFont.myMediumSystemFont(ofSize: 12)
        detailButton.tintColor = UIColor.white
        detailButton.backgroundColor = UIColor.mainPurpule
        
    }
    
    func setcellTitle(title: String){
        cellTitleLabel.text = title
    }

}
