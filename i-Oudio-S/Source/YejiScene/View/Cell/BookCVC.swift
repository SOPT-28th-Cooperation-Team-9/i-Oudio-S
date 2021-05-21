//
//  BookCVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit

class BookCVC: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleTextView: UILabel! {
        didSet {
 
            bookTitleTextView.textColor = .white
            bookTitleTextView.font = UIFont.myBoldSystemFont(ofSize: 13)
        }
    }
    @IBOutlet weak var authorTextView: UILabel! {
        didSet {
//            let padding = authorTextView.textContainer.lineFragmentPadding
//            authorTextView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: padding)
            authorTextView.textColor = .mainGray1
            authorTextView.font = UIFont.myMediumSystemFont(ofSize: 11)
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        

        // Initialization code
//        authorTextView.translatesAutoresizingMaskIntoConstraints = false
//        bookTitleTextView.translatesAutoresizingMaskIntoConstraints = false
//        authorTextView.topAnchor.constraint(equalTo: bookTitleTextView.bottomAnchor, constant: 4).isActive = true
//        authorTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
//        authorTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true
//        
//        bookTitleTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        
//        priceLabel.topAnchor.constraint(equalTo: authorTextView.bottomAnchor, constant: 4).isActive = true
//        
//        authorTextView.isScrollEnabled = false
//        bookTitleTextView.isScrollEnabled = false
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    override func prepareForReuse() {
        bookImageView = nil
        bookTitleTextView = nil
        authorTextView = nil
        priceLabel = nil
    }
    
}
