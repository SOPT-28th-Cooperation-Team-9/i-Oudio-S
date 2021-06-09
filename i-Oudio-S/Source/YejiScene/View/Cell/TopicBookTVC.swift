//
//  TopicBookTVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/22.
//

import UIKit

class TopicBookTVC: UITableViewCell {

    @IBOutlet weak var topicTitleLabel: UILabel! {
        didSet {
            topicTitleLabel.text = "주제별 오디오북"
            topicTitleLabel.textColor = .white
            topicTitleLabel.font =  UIFont.myBoldSystemFont(ofSize: 17)
        }
    }
    @IBOutlet weak var topicCollectionView: UICollectionView! {
        didSet {
            topicCollectionView.delegate = self
            topicCollectionView.dataSource = self
            topicCollectionView.backgroundColor = .black
        }
    }
    
    var topicList: [topicDataModel] = [
           topicDataModel(topicImage: "topicImage1", topicName: "소설"),
           topicDataModel(topicImage: "topicImage2", topicName: "시/에세이"),
           topicDataModel(topicImage: "topicImage3", topicName: "인문"),
           topicDataModel(topicImage: "topicImage4", topicName: "사회/역사/문화"),
           topicDataModel(topicImage: "topicImage5", topicName: "경제/경영"),
       ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerXib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerXib() {
        let topicBookCVC = UINib(nibName: "TopicBookCVC", bundle: nil)
        topicCollectionView.register(topicBookCVC, forCellWithReuseIdentifier: "TopicBookCVC")
    }
}

extension TopicBookTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicBookCVC", for: indexPath) as? TopicBookCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(topicImage: topicList[indexPath.row].topicImage, topic: topicList[indexPath.row].topicName)
        
        return cell
    }
    
    
}

extension TopicBookTVC : UICollectionViewDelegate {
    
}

extension TopicBookTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (68/375)
        let height = cellWidth * (87/68)
        
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
