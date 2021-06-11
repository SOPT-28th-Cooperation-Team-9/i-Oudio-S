//
//  AudioMainVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit
import Kingfisher

class AudioMainVC: ViewController {

    @IBOutlet weak var MainTableView: UITableView! {
        didSet {
            MainTableView.delegate = self
            MainTableView.dataSource = self
            MainTableView.backgroundColor = .mainGrayBackground
        }
    }
    
    private var handler: ((Result<MainDataModel, Error>) -> Void)!
    private var bookList: [BookDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()

        view.backgroundColor = .mainGrayBackground
    }
    
    private func registerXib() {
        let headerTVC = UINib(nibName: "HeaderTVC", bundle: nil)
        MainTableView.register(headerTVC, forCellReuseIdentifier: "HeaderTVC")
        
        let bookTVC = UINib(nibName: "BookTVC", bundle: nil)
        MainTableView.register(bookTVC, forCellReuseIdentifier: "BookTVC")

        let snsBookTVC = UINib(nibName: "SnsBookTVC", bundle: nil)
        MainTableView.register(snsBookTVC, forCellReuseIdentifier: "SnsBookTVC")
        
        let topicTVC = UINib(nibName: "yeji_TopicBookTVC", bundle: nil)
        MainTableView.register(topicTVC, forCellReuseIdentifier: "yeji_TopicBookTVC")
    }
}


extension AudioMainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let width = UIScreen.main.bounds.width
        switch indexPath.row {
        case 0:
            return width * (177/375)
        case 1:
            return width * (340/375)
        case 2:
            return width * (247/375)
        case 3:
            return width * (145/375)
        case 4:
            return width * (340/375)
        default:
            return 0
        }
    }
    
}

extension AudioMainVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC") as? HeaderTVC else { return UITableViewCell() }
            handler = { result in
                switch result {
                case .success(let mainData):
                    cell.setData(headerImage: mainData.choiceBook![0].bookImage, title: mainData.choiceBook![0].bookTitle, author: "김범석 저\n김범석 낭독", subTitle: "오늘만 무료! '수요 오디오 책방'" )
                case .failure(let err):
                    print(err)
                }
            }
            cell.selectionStyle = .none
            MainService.shared.getAllBook(completion: handler)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTVC") as? BookTVC else { return UITableViewCell() }
            handler = {
                result in
                switch result {
                case .success(let mainData):
                    cell.setData(bookList: mainData.worldLiterature!)
                case .failure(let err):
                    print(err)
                }
            }
            MainService.shared.getAllBook(completion: handler)
            cell.registerXib()
            cell.titleLabel.text = "민음사 세계문학 10권 70% 할인"
            cell.bookCollectionView.backgroundColor = .mainGrayBackground
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SnsBookTVC") as? SnsBookTVC else { return UITableViewCell() }
            handler = {
                result in
                switch result {
                case .success(let mainData):
                    cell.setData(snsBookList: mainData.topicBook!)
                case .failure(let err):
                    print(err)
                }
            }
            MainService.shared.getAllBook(completion: handler)
            cell.titleLabel.text = "요즘 SNS에서 화두인 책"
            cell.selectionStyle = .none
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "yeji_TopicBookTVC") as? yeji_TopicBookTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTVC") as? BookTVC else { return UITableViewCell() }
            handler = {
                result in
                switch result {
                case .success(let mainData):
                    cell.setData(bookList: mainData.poem!)
                case .failure(let err):
                    print(err)
                }
            }
            MainService.shared.getAllBook(completion: handler)
            cell.registerXib()
            cell.titleLabel.text = "새로 나온 시집"
            cell.backgroundColor = .black
            cell.bookCollectionView.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    
}
