//
//  RoundTVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class AudioTVC: UITableViewCell {
    
    static let identifier = "AudioTVC"
    private var books : [Book]?
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        setBook()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: RoundCVC.identifier, bundle: nil), forCellWithReuseIdentifier: RoundCVC.identifier)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setBook(){
                            
        self.books?.append(contentsOf: [
            Book.init(imageName: "book_audio1", title: "소설"),
            Book.init(imageName: "book_audio2", title: "시,에세이"),
            Book.init(imageName: "botitledio3", title: "인문"),
            Book.init(imageName: "book_audio4", title: "사회,역사,문화"),
            Book.init(imageName: "book_audio5", title: "경제,경영")
        ])
    }
    func setUI(){
        title.textColor = UIColor.white
        title.font = UIFont.myBoldSystemFont(ofSize: 17)
        
    }
}

extension AudioTVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (65/375)
        let cellHeight = cellWidth * (109/65)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}

extension AudioTVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundCVC.identifier, for: indexPath) as? RoundCVC else {return UICollectionViewCell()}
        
        if let imageName = books?[indexPath.row].imageName, let titleName = books?[indexPath.row].title{
            cell.setData(imageName, titleName)
        }
    
        return cell
    }
}
