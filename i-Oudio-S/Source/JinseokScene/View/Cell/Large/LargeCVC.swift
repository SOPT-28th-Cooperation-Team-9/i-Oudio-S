//
//  LargeCVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class LargeCVC: UICollectionViewCell {
    static let identifier = "LargeCVC"
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
