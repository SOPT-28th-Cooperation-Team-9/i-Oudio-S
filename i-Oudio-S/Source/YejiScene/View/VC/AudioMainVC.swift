//
//  AudioMainVC.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import UIKit

class AudioMainVC: ViewController {

    @IBOutlet weak var MainTableView: UITableView! {
        didSet {
            MainTableView.delegate = self
            MainTableView.dataSource = self
            MainTableView.backgroundColor = UIColor(red: (33 / 255), green: (33 / 255), blue: (33 / 255), alpha: 1.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()

        view.backgroundColor = UIColor(red: (33 / 255), green: (33 / 255), blue: (33 / 255), alpha: 1.0)
    }
    
    private func registerXib() {
        let headerTVC = UINib(nibName: "HeaderTVC", bundle: nil)
        MainTableView.register(headerTVC, forCellReuseIdentifier: "HeaderTVC")
        let bookTVC = UINib(nibName: "BookTVC", bundle: nil)
        MainTableView.register(bookTVC, forCellReuseIdentifier: "BookTVC")
        let snsBookTVC = UINib(nibName: "SnsBookTVC", bundle: nil)
        MainTableView.register(snsBookTVC, forCellReuseIdentifier: "SnsBookTVC")
    }
}


extension AudioMainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 177
        case 1:
            return 340
        case 2:
            return 340
        default:
            return 0
        }
    }
    
}

extension AudioMainVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC") as? HeaderTVC else { return UITableViewCell() }
            cell.setData(headerImage: "rectangle1057", title: "'유퀴즈' 출연 김범석 의사의 \n<어떤 죽음이 삶에게 말했다>", author: "김범석 저\n김범석 낭독", subTitle: "오늘만 무료! '수요 오디오 책방'" )
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTVC") as? BookTVC else { return UITableViewCell() }
            cell.registerXib()
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SnsBookTVC") as? SnsBookTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    
}
