//
//  BookTVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit

class BookTVC: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "민음사 세계문학 10권 70% 할인"
            titleLabel.textColor = .white
//            titleLabel.font = UIFont.NotoSansFont(weight: .Bold, size: 17)
        }
    }
    
    @IBOutlet weak var moreLabel: UILabel! {
        didSet {
            moreLabel.text = "더보기"
            moreLabel.textColor = UIColor(red: (126 / 255), green: (126 / 255), blue: (126 / 255), alpha: 1.0)
//            moreLabel.font = UIFont.NotoSansFont( size: 13)
        }
    }
    
    @IBOutlet weak var bookCollectionView: UICollectionView! {
        didSet {
            bookCollectionView.delegate = self
            bookCollectionView.dataSource = self
            bookCollectionView.backgroundColor = UIColor(red: (33 / 255), green: (33 / 255), blue: (33 / 255), alpha: 1.0)
        }
    }
    
    var bookData : [BookDataModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor(red: (33 / 255), green: (33 / 255), blue: (33 / 255), alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func registerXib() {
        let bookCVC = UINib(nibName: "BookCVC", bundle: nil)
        bookCollectionView.register(bookCVC, forCellWithReuseIdentifier: "BookCVC")
    }
    
}


extension BookTVC: UICollectionViewDelegate {
    
}

extension BookTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCVC", for: indexPath) as? BookCVC else {
                  return UICollectionViewCell()
              }
        
        cell.setData(bookImage: "rectangle1071", bookTitle: "위대한 유산(민음사 세계문학, 완...", author: "찰스 디킨스 저 서원석 외 1인 낭독", price: "대여 6,000원")
        
        return cell
    }
    
    
}


extension BookTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = UIScreen.main.bounds.width
        let cellWidth = width * (95/375)
        let height = cellWidth * (237/95)
  
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
