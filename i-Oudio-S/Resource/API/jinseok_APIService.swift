//
//  APIService.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/06/02.
//

import Foundation
import Alamofire

struct jinseok_APIService {
    
    static let shared = jinseok_APIService()
    
 
    func getMainPages(completion : @escaping(jinseok_NetworkResult<Any>) -> Void ){
        let header : HTTPHeaders = [jinseok_NetworkHeaderKey.CONTENT_TYPE.rawValue: jinseok_APIConstants.APPLICATION_JSON]
        
        let dataRequest = AF.request(jinseok_APIConstants.mainpageURL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header).validate(statusCode: 200...500)
        
        dataRequest.responseData { response in
            switch response.result{
           
            case .success :
                guard let statusCode =  response.response?.statusCode else { return }
                print(statusCode)
                guard let value =  response.value else{return}
                
                let networkResult = self.judgeStatus(by : statusCode, value)
                
                completion(networkResult)
    
            case .failure: completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode : Int, _ data : Data) -> jinseok_NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(jinseok_BookResponseData.self, from: data)
        else{return .pathErr}
        
        print(decodedData)
        switch statusCode {
        case 200: return .success(decodedData)
        case 400: return .requestErr("")
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
