//
//  HomeVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class JSHomeVC: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainBookView: UIView!
    @IBOutlet weak var mainBookTitle: UILabel!
    @IBOutlet weak var mainBookWriter: UILabel!
    @IBOutlet weak var mainBookSubTitle: UILabel!
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var mainTHV: UIView!

    private let sections: [String] = ["믿음사 세계문학 10권 70% 할인","요즘 SNS에서 화두인 책", "주제별 오디오북", "새로나온 시집"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMainPages()
        setUI()
        setResgister()
    }

    // MARK: - Navigation
    
    func setResgister(){
        mainTV.delegate = self
        mainTV.dataSource = self
    
        mainTV.register(UINib(nibName: DiscountTVC.identifier, bundle: nil), forCellReuseIdentifier: DiscountTVC.identifier)
        mainTV.register(UINib(nibName: TrendTVC.identifier, bundle: nil), forCellReuseIdentifier: TrendTVC.identifier)
        mainTV.register(UINib(nibName: AudioTVC.identifier, bundle: nil), forCellReuseIdentifier: AudioTVC.identifier)

    }
    func setUI(){
        //mainTV.tableHeaderView.hei
        mainTV.separatorStyle = .none
        mainTV.tableFooterView = UIView()
        mainTV.tableHeaderView = mainTHV
        mainTV.rowHeight = UITableView.automaticDimension
        
        mainBookView.backgroundColor = UIColor.mainBlue
        
        mainTitle.textColor = UIColor.white
        mainTitle.font = UIFont.myBoldSystemFont(ofSize: 26)
       
        mainBookTitle.textColor = UIColor.white
        mainBookTitle.text = "'유퀴즈 출연 김범석 의사의\n<어떤 죽음이 삶에게 말했다"
        mainBookTitle.font = UIFont.myBoldSystemFont(ofSize: 19)
        
        mainBookWriter.textColor = UIColor.white
        mainBookWriter.text = "김범석 저자\n김범석 낭독"
        mainBookWriter.font = UIFont.myRegularSystemFont(ofSize: 12)
       
        mainBookSubTitle.textColor = UIColor.white
        mainBookSubTitle.text = "오늘만 무료! '수요 오디오 책방'"
        mainBookSubTitle.font = UIFont.myBoldSystemFont(ofSize: 14)
    }
    
    func getMainPages(){
        print("vv")
        jinseok_APIService.shared.getMainPages{ result in
            print("aa")
            switch result{
            case .success(let data) :
                if let list = data as? jinseok_BookResponseData{
                    print(list.choiceBook[0].title)
                    print(list.topicBook[0].title)
                }
                //self.updateData()
            case .requestErr(_) : break
            case .serverErr: break
            case .networkFail: break
            case .pathErr: break
            }
        }
    }
    
    func updateData(){
        
        self.mainTV.reloadData()
    }
}

extension JSHomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let width = UIScreen.main.bounds.width
//
//        switch indexPath.row{
//        case 0: return width * (314/375)
//        case 1: return width * (262/375)
//        case 2: return width * (164/375)
//        case 3: return width * (314/375)
//        default: return 0
//        }
        
        switch indexPath.row{
        case 0: return 314
        case 1: return 262
        case 2: return 164
        case 3: return 314
        default: return 0
        }
    }
}

extension JSHomeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTVC.identifier, for: indexPath) as! DiscountTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrendTVC.identifier, for: indexPath) as! TrendTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: AudioTVC.identifier, for: indexPath) as! AudioTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTVC.identifier, for: indexPath) as! DiscountTVC
            cell.title.text = sections[indexPath.row]
            cell.contentView.backgroundColor = .black
            cell.collectionView.backgroundColor = .black
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
