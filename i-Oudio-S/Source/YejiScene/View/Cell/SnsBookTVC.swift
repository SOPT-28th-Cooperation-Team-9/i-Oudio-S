//
//  SnsBookTVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/18.
//

import UIKit

class SnsBookTVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.myBoldSystemFont(ofSize: 17)
            titleLabel.textColor = .white
        }
    }
    @IBOutlet weak var moreLabel: UILabel! {
        didSet {
            moreLabel.textColor = .mainGray1
            moreLabel.font = UIFont.myRegularSystemFont(ofSize: 13)
        }
    }
    
    @IBOutlet weak var bookCollectionView: UICollectionView! {
        didSet {
            bookCollectionView.backgroundColor = .black
            bookCollectionView.delegate = self
            bookCollectionView.dataSource = self
            bookCollectionView.backgroundColor = .black
        }
    }
    
    var snsBookList : [BookDataModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        registerXib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func registerXib() {
        let snsBookCVC = UINib(nibName: "SnsBookCVC", bundle: nil)
        bookCollectionView.register(snsBookCVC, forCellWithReuseIdentifier: "SnsBookCVC")
    }
    
    func setData(snsBookList: [BookDataModel]) {
        print(snsBookList)
        self.snsBookList = snsBookList
        self.bookCollectionView.reloadData()
    }
    
}

extension SnsBookTVC : UICollectionViewDelegate {
    
}

extension SnsBookTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return snsBookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SnsBookCVC", for: indexPath) as? SnsBookCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(bookImage: snsBookList[indexPath.row].bookImage, bookExplain: "김영하 작가가 함께 읽은", bookTitle: snsBookList[indexPath.row].bookTitle, author: snsBookList[indexPath.row].author, price: "대여 \(snsBookList[indexPath.row].rentPrice)원")

        return cell
    }
    
    
}

extension SnsBookTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = UIScreen.main.bounds.width
        let cellWidth = width * (324/375)
        let height = cellWidth * (180/324)
  
        return CGSize(width: cellWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 18, bottom: 0, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
