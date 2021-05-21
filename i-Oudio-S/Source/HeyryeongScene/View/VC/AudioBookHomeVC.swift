//
//  AudioHomeVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/15.
//

import UIKit

class AudioBookHomeVC: UIViewController {

    var fictionBooks : [BasicBookData] = []
    var poemBooks: [BasicBookData] = []
    var topicBooks: [TopicBookData] = []
    var snsBooks: [BasicBookData] = []
    
    @IBOutlet weak var playingAudioNameLabel: UILabel!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setBooksData()
        registerXib()
        setDelegate()
        // Do any additional setup after loading the view.
    }
    
    
    func registerXib(){
        let headerNib = UINib(nibName: AudioHeaderTVC.identifier, bundle: nil)
        mainTableView.register(headerNib, forCellReuseIdentifier: AudioHeaderTVC.identifier)
        
        let basicBookNib = UINib(nibName: BasicBookTVC.identifier, bundle: nil)
        mainTableView.register(basicBookNib, forCellReuseIdentifier: BasicBookTVC.identifier)
        
        let topicBookNib = UINib(nibName: TopicBookTVC.identifier, bundle: nil)
        mainTableView.register(topicBookNib, forCellReuseIdentifier: TopicBookTVC.identifier)
        
        let snsBookNib =  UINib(nibName: SNSBookTVC.identifier, bundle: nil)
        mainTableView.register(snsBookNib, forCellReuseIdentifier: SNSBookTVC.identifier)
    }

    func setUI(){
        playingAudioNameLabel.textColor = UIColor.mainGray1
        playingAudioNameLabel.font = UIFont.myMediumSystemFont(ofSize: 13)
        playingAudioNameLabel.text = "재생목록이 없습니다."
        
        mainTableView.separatorStyle = .none
        
    }
    
    func setDelegate(){
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
}

extension AudioBookHomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        
        switch indexPath.section {
        case 0:
            return width * (228/375)
        case 2:
            return width * (286/375)
        case 3:
            return width * (145/375)
        default:
            return width * (343/375)
        }
        
    }
    
}

extension AudioBookHomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AudioHeaderTVC.identifier) as? AudioHeaderTVC else {
                return UITableViewCell()
            }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicBookTVC.identifier) as? BasicBookTVC else {
                return UITableViewCell()
            }
            
            cell.bookList = fictionBooks
            cell.setTitleText(title: "믿음사 세계문학 10권 70% 할인")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SNSBookTVC.identifier) as? SNSBookTVC else {
                return UITableViewCell()
            }
            
            cell.bookList = snsBooks
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopicBookTVC.identifier) as? TopicBookTVC else {
                return UITableViewCell()
            }
            
            cell.topicBookList = topicBooks
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicBookTVC.identifier) as? BasicBookTVC else {
                return UITableViewCell()
            }
            
            cell.bookList = poemBooks
            cell.setTitleText(title: "새로나온 시집")
            return cell
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}



// MARK: Data
extension AudioBookHomeVC{
    
    func setBooksData(){
        setFictionBooks()
        setPoemBooks()
        setTopicBookList()
    }
    
    func setFictionBooks(){
        fictionBooks.append(contentsOf:[
                BasicBookData.init(imageName: "book_fiction1",
                                       title: "데미안 (믿음사 세계문학, 완독본)",
                                       author: "헤르만 헤세 저\n최승훈 외 1인 낭독",
                                       price: 2700,
                                       time: 659),
                BasicBookData.init(imageName: "book_fiction2",
                                   title: "자기만의 방 (믿음사 세계문학, 완독본)",
                                   author: "버지니아 울프 저\n천지선 낭독",
                                   price: 1_800,
                                   time: 455),
                BasicBookData.init(imageName: "book_fiction3",
                                   title: "위대한 유산 (믿음사 세계문학, 완독본)",
                                   author: "찰스 디킨스 저\n서원석 외 1인 낭독",
                                   price: 6_000,
                                   time: 2756),
                BasicBookData.init(imageName: "book_fiction4",
                                   title: "오만과 편견 (믿음사 세계문학, 완독본)",
                                   author: "제인 오스틴 저\n전해리 외 1인 낭독",
                                   price: 3_600,
                                   time: 1657)
        ])
    }
    
    func setPoemBooks(){
        poemBooks.append(contentsOf: [
                BasicBookData.init(imageName: "book_poem1",
                               title: "그대 안에 봄이 있다",
                               author: "김종해 저\n더여린 낭독",
                               price: 6_000,
                               time: 157),
            
                BasicBookData.init(imageName:"book_poem2",
                                   title: "그런 사람 또 없습니다.",
                                   author: "원태연 저\n신범식 낭독",
                                   price: 4_830,
                                   time: 157),
            
                BasicBookData.init(imageName: "book_poem3",
                                   title: "자세히 보아야 예쁘다",
                                   author: "나태주 저\n문형진 낭독",
                                   price: 4_725,
                                   time: 157),
            
                BasicBookData.init(imageName: "book_poem4",
                                   title: "8자를 잡다",
                                   author: "조현숙 저\n김미자 낭독",
                                   price: 3_500,
                                   time: 157)
        ])
        
    }
    
    
    func setTopicBookList(){
        topicBooks.append(contentsOf: [
            TopicBookData.init(imageName: "book_audio1", topic: "소설"),
            TopicBookData.init(imageName: "book_audio2", topic: "시,에세이"),
            TopicBookData.init(imageName: "book_audio3", topic: "인문"),
            TopicBookData.init(imageName: "book_audio4", topic: "사회,역사,문화"),
            TopicBookData.init(imageName: "book_audio5", topic: "경제,경영")
        ])
        
    }
}
