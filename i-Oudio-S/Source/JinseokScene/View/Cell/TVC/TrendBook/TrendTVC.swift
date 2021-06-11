//
//  LargeTVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class TrendTVC : UITableViewCell {
    
    static let identifier = "TrendTVC"
    
    var bookList : [jinseok_BookData] = []
    var books : [jinseok_BookData]{
        get {
            return bookList
        }
        set(newVal){
            bookList = newVal
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: LargeRectCVC.identifier, bundle: nil), forCellWithReuseIdentifier: LargeRectCVC.identifier)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUI(){
        title.textColor = UIColor.white
        title.font = UIFont.myBoldSystemFont(ofSize: 17)
        
        moreBtn.setTitleColor(UIColor.mainGray1, for: .normal)
        moreBtn.titleLabel?.font = UIFont.myMediumSystemFont(ofSize: 13)
    }
    
}

extension TrendTVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (324/375)
        let cellHeight = cellWidth * (180/324)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension TrendTVC : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeRectCVC.identifier, for: indexPath) as? LargeRectCVC else {return UICollectionViewCell()}
        
        cell.mainTitle.text = "메인타이틀"
        cell.subTitle.text = "서브타이틀"
        cell.writer.text = "Writer test"
        cell.price.text = "Price test"
        
        return cell
    }
}
