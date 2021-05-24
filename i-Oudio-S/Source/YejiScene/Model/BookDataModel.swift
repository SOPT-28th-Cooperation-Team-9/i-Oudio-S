//
//  BookDataModel.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/18.
//

import Foundation

struct BookDataModel: Codable {
    var bookImage: String
    var bookTitle: String
    var author: String
    var runningTime: String
    var rentPrice: String
    
    enum CodingKeys: String, CodingKey {
        case bookImage = "image"
        case bookTitle = "title"
        case author = "writer"
        case runningTime = "clipTime"
        case rentPrice = "price"
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bookImage = (try? values.decode(String.self, forKey: .bookImage)) ?? ""
        bookTitle = (try? values.decode(String.self, forKey: .bookTitle)) ?? ""
        author = (try? values.decode(String.self, forKey: .author)) ?? ""
        runningTime = (try? values.decode(String.self, forKey: .runningTime)) ?? ""
        rentPrice = (try? values.decode(String.self, forKey: .rentPrice)) ?? ""
    }
}
