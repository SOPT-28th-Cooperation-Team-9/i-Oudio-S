//
//  MainService.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/24.
//

import Foundation
import Alamofire

struct MainService {
    
    static let shared = MainService()
    
    func getAllBook(completion: @escaping (Result<MainDataModel, Error>) -> Void) {
        
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.mainURL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseDecodable { (response: AFDataResponse<MainDataModel>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    

    
}
