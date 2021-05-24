//
//  NetworkResult.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
