//
//  SmallTVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class DiscountTVC: UITableViewCell {
    
    static let identifier = "DiscountTVC"
    
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: SmallRectCVC.identifier, bundle: nil), forCellWithReuseIdentifier: SmallRectCVC.identifier)
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

extension DiscountTVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width

        let cellWidth = width * (95/375)
        let cellHeight = cellWidth * (277/95)

        return CGSize(width: cellWidth, height: cellHeight)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 30)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
  
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //guard let nextVC = storyboard?.instantiateViewController(identifier: "datatestVC") else{return}
        
//        self.celldelegate = nextVC as? CellDelegate
//        
//        if let friend = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell{
//            celldelegate?.sendData(name: friend.nameLabel.text!, image: friend.Friendimage.image!)
//        }
//        
//        nextVC.modalPresentationStyle = .overFullScreen
//        
//        self.present(nextVC, animated: true, completion: nil)
    }
}
extension DiscountTVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRectCVC.identifier, for: indexPath) as? SmallRectCVC else {return UICollectionViewCell()}
        cell.backgroundColor = self.backgroundColor
        cell.bookTitle.text = "데미안 민음사\n세계문학,완독"
        cell.writer.text = "Writer test"
        cell.price.text = "Price test"
        
        return cell
    }
}
