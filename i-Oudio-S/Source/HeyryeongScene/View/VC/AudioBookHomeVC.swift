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
    var snsTitleList:[String] = ["김영하", "김영하2"]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func registerXib(){
        let headerNib = UINib(nibName: AudioHeaderTVC.identifier, bundle: nil)
        mainTableView.register(headerNib, forCellReuseIdentifier: AudioHeaderTVC.identifier)
        
        let basicBookNib = UINib(nibName: BasicBookTVC.identifier, bundle: nil)
        mainTableView.register(basicBookNib, forCellReuseIdentifier: BasicBookTVC.identifier)
        
        let topicBookNib = UINib(nibName: HRTopicBookTVC.identifier, bundle: nil)
        mainTableView.register(topicBookNib, forCellReuseIdentifier: HRTopicBookTVC.identifier)
        
        let snsBookNib =  UINib(nibName: SNSSaleBookTVC.identifier, bundle: nil)
        mainTableView.register(snsBookNib, forCellReuseIdentifier: SNSSaleBookTVC.identifier)
    }

    func setUI(){
        self.navigationController?.isNavigationBarHidden = true

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
            return width * (248/375)
        case 1 :
            return width * (343/375)
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
            print("cell이 셋팅")
            cell.selecteBookAction = { bookData in
                guard let nextVC = self.storyboard?.instantiateViewController(identifier: DetailBookVC.identifier) as? DetailBookVC else {
                    return false
                }
                nextVC.bookData = bookData
                
                self.navigationController?.pushViewController(nextVC, animated: true)
                //self.present(nextVC, animated: true, completion: nil)
                print("클로져 구현")
                return true
            }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SNSSaleBookTVC.identifier) as? SNSSaleBookTVC else {
                return UITableViewCell()
            }
            
            cell.bookList = snsBooks
            cell.titleList = snsTitleList
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HRTopicBookTVC.identifier) as? HRTopicBookTVC else {
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
        setSNSBookList()
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
    
    func setSNSBookList(){
        snsBooks.append(contentsOf: [
            BasicBookData.init(imageName: "book_sns1",
                               title: "어린이라는 세계",
                               author: "김소영 저\n여민정 낭독", price: 7_000, time: 615),
            BasicBookData.init(imageName: "book_sns2",
                               title: "어린이라는 세계",
                               author: "김소영 저\n여민정 낭독", price: 7_000, time: 615),
            
        ])
    }
    
}
