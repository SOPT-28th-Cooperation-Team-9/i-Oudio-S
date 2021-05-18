//
//  FictionBooksTVC.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import UIKit

class BasicBookTVC: UITableViewCell {

    static let identifier = "BasicBookTVC"
    
    @IBOutlet weak var plusButton: UIButton!
    var bookList :[BasicBookData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        registerXib()
        setDelegate()
        
        // Initialization code
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plueButton: UIButton!
    
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    
    func registerXib(){
        let nibName = UINib(nibName: "BasicBookCVC", bundle: nil)
        contentsCollectionView.register(nibName, forCellWithReuseIdentifier: "BasicBookCVC")
    }
    
    func setUI(){
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.myBoldSystemFont(ofSize: 17)
        
        plusButton.tintColor = UIColor.mainGray1
        plusButton.titleLabel?.font = UIFont.myMediumSystemFont(ofSize: 13)
        
        contentsCollectionView.backgroundColor = UIColor.black
    }
    
    func setTitleText(title: String){
        titleLabel.text = title
    }
    
    func setBookListData(books: [BasicBookData]){
        bookList = books
    }
    
    func setDelegate(){
        contentsCollectionView.dataSource = self
        contentsCollectionView.delegate = self
    }
    
    
}

extension BasicBookTVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicBookCVC.identifier, for: indexPath) as? BasicBookCVC else {
            return UICollectionViewCell()
        }
        
        cell.setContentData(book: bookList[indexPath.row])
        return cell
    }
    
    
}

extension BasicBookTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (95/375)
        let cellHeight = cellWidth * (237/95)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
}

