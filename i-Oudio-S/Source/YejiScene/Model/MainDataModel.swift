//
//  mainDataModel.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/24.
//

import Foundation

struct MainDataModel : Codable {
    var choiceBook : [BookDataModel]?
    var worldLiterature : [BookDataModel]?
    var topicBook : [BookDataModel]?
    var poem : [BookDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case choiceBook
        case worldLiterature
        case topicBook
        case poem
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        choiceBook = (try? values.decode([BookDataModel].self, forKey: .choiceBook)) ?? nil
        worldLiterature = (try? values.decode([BookDataModel].self, forKey: .worldLiterature)) ?? nil
        topicBook = (try? values.decode([BookDataModel].self, forKey: .topicBook)) ?? nil
        poem = (try? values.decode([BookDataModel].self, forKey: .poem)) ?? nil
    }
}
