//
//  BasicBooksCVC.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import UIKit


class BasicBookCVC: UICollectionViewCell{
    
    static let identifier: String = "BasicBookCVC"

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeUIView: UIView!
    
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
        timeLabel.text = "\(book.time / 100)시간 \(book.time % 100)분"
    }
    
    func setUI(){
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myMediumSystemFont(ofSize: 13)
        
        authorLabel.numberOfLines = 2
        authorLabel.textColor = UIColor.mainGray1
        authorLabel.font = UIFont.myMediumSystemFont(ofSize: 11)
        
        priceLabel.textColor = UIColor.white
        priceLabel.font = UIFont.myMediumSystemFont(ofSize: 10)
        
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.myMediumSystemFont(ofSize: 10)
        
        timeUIView.layer.cornerRadius = 1
    }
    
    

}


