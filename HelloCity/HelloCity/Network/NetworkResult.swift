//
//  NetworkResult.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T) // 성공 
    case requestErr(T) // 요청 에러
    case pathErr // 경로 에러
    case serverErr // 서버 내부 에러
    case networkFail // 네트워크 연결 실패
}
