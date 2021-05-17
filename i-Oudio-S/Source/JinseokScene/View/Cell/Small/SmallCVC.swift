//
//  SmallCVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class SmallCVC: UICollectionViewCell {

    static let identifier = "SmallCVC"
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
