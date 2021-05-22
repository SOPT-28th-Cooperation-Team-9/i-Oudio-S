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
            authorTextView.textColor = .mainGray1
            authorTextView.font = UIFont.myMediumSystemFont(ofSize: 11)
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var runningTimeLabel: UILabel! {
        didSet {
            runningTimeLabel.backgroundColor = .mainGray1
            runningTimeLabel.textColor = .white
            runningTimeLabel.font = UIFont.myMediumSystemFont(ofSize: 10)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(bookImage: String,
                 bookTitle: String,
                 author: String,
                 price: String,
                 runningTime: String) {
        
        if let image = UIImage(named: bookImage) {
            bookImageView.image = image
        }
        bookTitleTextView.text = bookTitle
        authorTextView.text = author
        priceLabel.text = price
        runningTimeLabel.text = runningTime
    }
        
}
