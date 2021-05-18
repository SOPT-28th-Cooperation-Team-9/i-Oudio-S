//
//  BasicBookData.swift
//  i-Oudio-S
//
//  Created by JangHyeRyeong on 2021/05/18.
//

import Foundation

struct BasicBookData {
    let imageName:String
    let title: String
    let author: String
    let price: Int
    let time: Int
    
    init(imageName: String,title: String, author: String, price: Int, time: Int){
        self.imageName = imageName
        self.title = title
        self.author = author
        self.price = price
        self.time = time
    }
}
