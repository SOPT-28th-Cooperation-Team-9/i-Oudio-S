//
//  RoundCVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class RoundCVC: UICollectionViewCell {

    static let identifier = "RoundCVC"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ imageName : String, _ titleName: String){
        image.image = UIImage(named: imageName)
        title.text = titleName
    }

}
