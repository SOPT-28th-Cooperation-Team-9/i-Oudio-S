//
//  Book.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/05/20.
//

import Foundation

struct Book : Codable{
    var imageName : String?
    var title : String?
    var writer : String?
    var reader : String?
    var price : String?
    var detail : String?
    
    init(imageName : String, title : String){
        self.imageName = imageName
        self.title = title
    }

}
