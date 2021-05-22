//
//  SNSBookTVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/18.
//

import UIKit

class SNSSaleBookTVC: UITableViewCell {

    static let identifier = "SNSSaleBookTVC"
    var bookList: [BasicBookData] = []
    var titleList: [String] = []
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        //setDelegate()
        
        contentsCollectionView.backgroundColor = .yellow
        contentsCollectionView.dataSource = self
        contentsCollectionView.delegate = self
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func registerXib(){
        let nibName = UINib(nibName: "SNSSaleBookCVC", bundle: nil)
        contentsCollectionView.register(nibName, forCellWithReuseIdentifier: "SNSSaleBookCVC")
    }
    
    
    func setUI(){
        titleLabel.text = "요즘 SNS에서 화두인 책"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 17)
        
        plusButton.tintColor = UIColor.mainGray1
        plusButton.titleLabel?.font = UIFont.myMediumSystemFont(ofSize: 13)
        
        contentsCollectionView.backgroundColor = UIColor.black
    }
    
    func setDelegate(){
        contentsCollectionView.dataSource = self
        contentsCollectionView.delegate = self
    }
    
}

extension SNSSaleBookTVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(bookList.count)
        return bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SNSSaleBookCVC.identifier, for: indexPath) as? SNSSaleBookCVC else {
            print("ddd")
            return UICollectionViewCell()
        }
        
        cell.setContentData(book: bookList[indexPath.item])
        cell.setCellTitle(title: titleList[indexPath.item])
        print("cell 로딩 ok , \(indexPath.row)")
        return cell
    }
    
}

extension SNSSaleBookTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (324/375)
        let cellHeight = cellWidth * (180/324)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
