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
            titleLabel.textColor = .white
            titleLabel.font = UIFont.myBoldSystemFont(ofSize: 17)
        }
    }
    
    @IBOutlet weak var moreLabel: UILabel! {
        didSet {
            moreLabel.text = "더보기"
            moreLabel.textColor = .mainGray1
            moreLabel.font = UIFont.myMediumSystemFont(ofSize: 13)
        }
    }
    
    @IBOutlet weak var bookCollectionView: UICollectionView! {
        didSet {
            bookCollectionView.delegate = self
            bookCollectionView.dataSource = self
//            bookCollectionView.backgroundColor = .mainGrayBackground
        }
    }
    
    var bookList: [BookDataModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .mainGrayBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func registerXib() {
        let bookCVC = UINib(nibName: "BookCVC", bundle: nil)
        bookCollectionView.register(bookCVC, forCellWithReuseIdentifier: "BookCVC")
    }
    
    func setData(bookList: [BookDataModel]) {
        self.bookList = bookList
        self.bookCollectionView.reloadData()
    }
    
    
}


extension BookTVC: UICollectionViewDelegate {
    
}

extension BookTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCVC", for: indexPath) as? BookCVC else {
                  return UICollectionViewCell()
              }
        
        cell.setData(bookImage: bookList[indexPath.row].bookImage, bookTitle: bookList[indexPath.row].bookTitle, author: bookList[indexPath.row].author, price: "대여 \(bookList[indexPath.row].rentPrice)원", runningTime: bookList[indexPath.row].runningTime)
        
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
