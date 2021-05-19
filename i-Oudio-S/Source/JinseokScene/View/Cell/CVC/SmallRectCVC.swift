//
//  SmallCVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class SmallRectCVC: UICollectionViewCell {

    static let identifier = "SmallRectCVC"
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        // Initialization code
    }
    
    func setUI(){
        bookTitle.textColor = UIColor.white
        writer.textColor = UIColor.mainGray1
        price.textColor = UIColor.white
        
        bookTitle.font = UIFont.myMediumSystemFont(ofSize: 13)
        writer.font = UIFont.myMediumSystemFont(ofSize: 11)
        price.font = UIFont.myMediumSystemFont(ofSize: 11)
    }

}
