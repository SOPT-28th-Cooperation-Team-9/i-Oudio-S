//
//  SNSBookTVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/18.
//

import UIKit

class SNSBookTVC: UITableViewCell {

    static let identifier = "SNSBookTVC"
    var bookList: [BasicBookData] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        setUI()
        setDelegate()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerXib(){
        let nibName = UINib(nibName: SNSBookCVC.identifier, bundle: nil)
        contentsCollectionView.register(nibName, forCellWithReuseIdentifier: SNSBookCVC.identifier)
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

extension SNSBookTVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SNSBookCVC.identifier, for: indexPath) as? SNSBookCVC else {
            return UICollectionViewCell()
        }
        
        cell.setContentData(book: bookList[indexPath.row])
        return cell
    }
    
    
}

extension SNSBookTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (324/375)
        let cellHeight = cellWidth * (180/324)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
}
