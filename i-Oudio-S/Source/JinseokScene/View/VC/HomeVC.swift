//
//  HomeVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/17.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var mainTHV: UIView!
    
    private let sections: [String] = ["믿음사 세계문학 10권 70% 할인","요즘 SNS에서 화두인 책", "주제별 오디오북", "새로나온 시집"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTV.tableHeaderView = mainTHV
        //mainTV.separatorStyle = .none
        mainTV.rowHeight = UITableView.automaticDimension
        mainTV.register(UINib(nibName: "SmallTVC", bundle: nil), forCellReuseIdentifier: "SmallTVC")
        mainTV.register(UINib(nibName: "LargeTVC", bundle: nil), forCellReuseIdentifier: "LargeTVC")
        mainTV.register(UINib(nibName: "RoundTVC", bundle: nil), forCellReuseIdentifier: "RoundTVC")
        
        mainTV.delegate = self
        mainTV.dataSource = self
    }

    // MARK: - Navigation
}

extension HomeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0: return 300
        case 1: return 262
        case 2: return 136
        case 3: return 300
        default:
            return 0
        }
    }
}

extension HomeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SmallTVC", for: indexPath) as! SmallTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LargeTVC", for: indexPath) as! LargeTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoundTVC", for: indexPath) as! RoundTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SmallTVC", for: indexPath) as! SmallTVC
            cell.title.text = sections[indexPath.row]
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
