//
//  HRTopicBookTVC.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import UIKit

class HRTopicBookTVC: UITableViewCell {

    static let identifier = "HRTopicBookTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    var topicBookList : [TopicBookData] = []
    
    @IBOutlet weak var topicCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        registerXib()
        setDelegate()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 17)
        titleLabel.text = "주제별 오디오북"
    }
    
    func registerXib(){
        let nibName = UINib(nibName: "HRTopicBookCVC", bundle: nil)
        topicCollectionView.register(nibName, forCellWithReuseIdentifier: "HRTopicBookCVC")
    }
    
    
    func setDelegate(){
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
    }
    
}

extension HRTopicBookTVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: HRTopicBookCVC.identifier, for: indexPath) as? HRTopicBookCVC else {
            return UICollectionViewCell()
        }
        
        cell.setContent(book: topicBookList[indexPath.row])
        
        return cell
    }
    
    
}

extension HRTopicBookTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (65/375)
        let cellHeight = cellWidth * (87/65)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

