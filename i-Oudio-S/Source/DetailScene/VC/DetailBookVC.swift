//
//  DetailBookVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/21.
//

import UIKit

class DetailBookVC: UIViewController {

    static let identifier = "DetailBookVC"
    var bookData: BasicBookData?
    var bookModelData: BookDataModel?
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var detaileTableView: UITableView!
    
    let menuTitle: [String] = ["챕터9", "댓글64", "북정보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        registerXib()
        setDelegate()
    }
    
    
    func setNavigation(){
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = .white
         
        let label = UILabel()
        label.text = getBookTitle()
        label.textColor = UIColor.white
        label.font = UIFont.myBoldSystemFont(ofSize: 25)
        label.textAlignment = .left
        self.navigationItem.titleView = label
    }
    
    func getBookTitle() -> String{
        if let book = bookData {
            return book.title
        }
        
        if let book = bookModelData{
            return book.bookTitle
        }
        return ""
    }

    func registerXib(){
        let cvcNib = UINib(nibName: MenuCVC.identifier, bundle: nil)
        mainCollectionView.register(cvcNib, forCellWithReuseIdentifier: MenuCVC.identifier)
        
        let tvcNib = UINib(nibName: DetailAudioTVC.identifier, bundle: nil)
        detaileTableView.register(tvcNib, forCellReuseIdentifier: DetailAudioTVC.identifier)
    }
    
    func setDelegate(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        //detaileTableView.delegate = self
        detaileTableView.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}

extension DetailBookVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailHeaderCVC.identifier, for: indexPath) as? DetailHeaderCVC else {
            return UICollectionReusableView()
        }
        
        if let book = bookData {
            headerView.setContent(book: book)
        }
        
        if let book = bookModelData{
            headerView.setContent(book: book)
        }
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MenuCVC.identifier, for: indexPath) as? MenuCVC else {
            return UICollectionViewCell()
            
        }
    
        if indexPath.item ==  0 {
            cell.setTitle(title: menuTitle[indexPath.item], isCurrent: true)
        }else{
            cell.setTitle(title: menuTitle[indexPath.item], isCurrent: false)
        }
        
        return cell
    }
    
}

extension DetailBookVC: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width*(75/375)
        let cellHeight = cellWidth*(41/75)
        
        print("cell size \(cellWidth), \(cellHeight)")
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}

extension DetailBookVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detaileTableView.dequeueReusableCell(withIdentifier: DetailAudioTVC.identifier) as! DetailAudioTVC
        return cell
    }
    
    
}

