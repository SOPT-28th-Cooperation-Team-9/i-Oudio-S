//
//  MenuCVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/21.
//

import UIKit

class MenuCVC: UICollectionViewCell {

    static let identifier = "MenuCVC"
    
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var seperatorLineView: UIView!
    var title: String = ""
    var isCurrent: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        print(self.bounds.width)
        print(self.bounds.height)
        //setUI()
        // Initialization code
    }

    func setTitle(title: String, isCurrent: Bool){
        self.title = title
        self.isCurrent = isCurrent
        setUI()
    }
    
    func setUI(){
        print("title = \(title), isCurrent = \(isCurrent)")
        menuTitleLabel.text = title
        menuTitleLabel.font = UIFont.myBoldSystemFont(ofSize: 14)
        
        menuTitleLabel.textColor = UIColor.white
        seperatorLineView.layer.cornerRadius = 3
        seperatorLineView.isHidden = !isCurrent
        
        if isCurrent{
            menuTitleLabel.textColor = UIColor.white
            
        }else{
            menuTitleLabel.textColor = UIColor.mainGray1
            
        }

    }
    
    
}
