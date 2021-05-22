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
    
    var book : Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let b = book{
            name.text = b.title
            writer.text = b.writer
            reader.text = b.reader
            price.text = b.price
        }
        
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
