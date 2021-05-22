//
//  SnsBookCVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/18.
//

import UIKit

class SnsBookCVC: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookExplainLabel: UILabel! {
        didSet {
            bookExplainLabel.textColor = UIColor(red: 115 / 255, green: 75 / 255, blue: 249 / 255, alpha: 1.0)
            bookExplainLabel.font = UIFont.myBoldSystemFont(ofSize: 13)
            
        }
    }
    @IBOutlet weak var bookTitleLabel: UILabel! {
        didSet {
            bookTitleLabel.textColor = .white
            bookPriceLabel.font = UIFont.myRegularSystemFont(ofSize: 13)
        }
    }
    @IBOutlet weak var authorTextView: UITextView! {
        didSet {
            authorTextView.textColor = .mainGray1
            authorTextView.backgroundColor = .mainGrayBackground
            authorTextView.font = UIFont.myRegularSystemFont(ofSize: 11)
            let padding = authorTextView.textContainer.lineFragmentPadding
            authorTextView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: padding)
            
        }
    }
    @IBOutlet weak var bookPriceLabel: UILabel! {
        didSet {
            bookPriceLabel.textColor = .white
            bookPriceLabel.font = UIFont.myRegularSystemFont(ofSize: 11)
        }
    }
    
    @IBOutlet weak var detailButton: UIButton! {
        didSet {
            detailButton.backgroundColor = .mainPurpule
            detailButton.setTitle("자세히 보기", for: .normal)
            detailButton.setTitleColor(.white, for: .normal)
            detailButton.titleLabel?.font = UIFont.myRegularSystemFont(ofSize: 12)
            detailButton.layer.cornerRadius = 2
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .mainGrayBackground
    }
    
    func setData(bookImage: String,
                 bookExplain: String,
                 bookTitle: String,
                 author: String,
                 price: String) {
        
        if let image = UIImage(named: bookImage) {
            bookImageView.image = image
        }
        bookExplainLabel.text = bookExplain
        bookTitleLabel.text = bookTitle
        authorTextView.text = author
        bookPriceLabel.text = price
    }
}
