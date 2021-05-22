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
        }
    }
    @IBOutlet weak var bookTitleLabel: UILabel! {
        didSet {
            bookTitleLabel.textColor = .white
        }
    }
    @IBOutlet weak var authorLabel: UITextView! {
        didSet {
            authorLabel.textColor = UIColor(red: 126 / 255, green: 126 / 255, blue: 128 / 255, alpha: 1.0)
            authorLabel.backgroundColor = UIColor(red: 33 / 255, green: 33 / 255, blue: 33 / 255, alpha: 1.0)
        }
    }
    @IBOutlet weak var bookPriceLabel: UILabel! {
        didSet {
            bookPriceLabel.textColor = .white
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        bookTitleLabel.text = bookExplain
        authorLabel.text = author
        bookPriceLabel.text = price
    }
}
