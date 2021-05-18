//
//  BookCVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit

class BookCVC: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleTextView: UITextView! {
        didSet {
            let padding = bookTitleTextView.textContainer.lineFragmentPadding
            
            bookTitleTextView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: padding)
            bookTitleTextView.textColor = .white
//            bookTitleTextView.font = UIFont.NotoSansFont(weight: .Bold, size: 13)
        }
    }
    @IBOutlet weak var authorTextView: UITextView! {
        didSet {
            
            let padding = authorTextView.textContainer.lineFragmentPadding
            
            authorTextView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: padding)
            authorTextView.textColor = UIColor(red: (126 / 255), green: (126 / 255), blue: (126 / 255), alpha: 1.0)
            // 왜 미디엄만 쓰면 오류?
            //            authorTextView.font = UIFont.NotoSansFont(weight: .Medium, size: 11)
            
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(bookImage: String,
                 bookTitle: String,
                 author: String,
                 price: String) {
        
        if let image = UIImage(named: bookImage) {
            bookImageView.image = image
        }
        bookTitleTextView.text = bookTitle
        authorTextView.text = author
        priceLabel.text = price
        
    }
    
}
