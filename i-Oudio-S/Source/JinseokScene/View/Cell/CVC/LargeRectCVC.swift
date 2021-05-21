//
//  LargeCVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class LargeRectCVC: UICollectionViewCell {
    static let identifier = "LargeRectCVC"
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        // Initialization code
    }

    func setUI(){
        mainTitle.textColor = UIColor.mainPurpule
        subTitle.textColor = UIColor.white
        writer.textColor = UIColor.mainGray1
        price.textColor = UIColor.white
        
        mainTitle.font = UIFont.myBoldSystemFont(ofSize: 13)
        subTitle.font = UIFont.myMediumSystemFont(ofSize: 13)
        writer.font = UIFont.myMediumSystemFont(ofSize: 11)
        price.font = UIFont.myMediumSystemFont(ofSize: 11)
    }
}
