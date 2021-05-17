//
//  AudioHomeVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/15.
//

import UIKit

class AudioHomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String = "혜령"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        //사용 방법
        nameLabel.textColor = UIColor.mainPurpule
        nameLabel.font = UIFont.myBoldSystemFont(ofSize: 20)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
