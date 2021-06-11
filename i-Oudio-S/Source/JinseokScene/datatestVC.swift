//
//  datatestVC.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/22.
//

import UIKit

class datatestVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var reader: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var book : jinseok_BookData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
