//
//  NetworkResult.swift
//  i-Oudio-S
//
//  Created by 홍진석 on 2021/06/02.
//

import Foundation

enum jinseok_NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
}
