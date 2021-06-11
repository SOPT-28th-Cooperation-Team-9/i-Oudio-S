//
//  BookResponseData.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/06/02.
//

import Foundation

struct jinseok_BookResponseData : Codable{
    let choiceBook : [jinseok_BookData]
    let workdLiterature : [jinseok_BookData]
    let topicBook : [jinseok_BookData]
    let poem : [jinseok_BookData]
}

struct jinseok_BookData : Codable{
    let image : String
    let title : String
    let writer : String
    var reader : String?
    var clipTime : String?
    var rentPrice : String?
    var price : String?
}
