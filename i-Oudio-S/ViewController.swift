//
//  ViewController.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
    
        let storyboard = UIStoryboard.init(name: "audio", bundle : nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "HomeVC") as? HomeVC else{return}
        self.navigationController?.pushViewController(nextVC, animated: true)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

