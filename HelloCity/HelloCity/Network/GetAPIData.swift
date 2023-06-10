//
//  GetAPIData.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/10.
//

import Foundation
import Alamofire

class GetAPIData {
    static let shared = GetAPIData()
    
    private init() {}
    
    func getHotelList() {
        let url = APIConstants.hotelURL
        
        let dataRequset = AF.request(url,
                                     method: .get,
                                     parameters: nil).validate(statusCode: 200..<300)
        
        var hotelList:[Hotel] = []
        dataRequset.responseJSON() { response in
            switch response.result {
            case .success(let value):
                if let jsonData = value as? [String:Any]{
                    print("Data count : \(jsonData.count)")
                    
                    if let 
                    // 여기서 부터 jsonData['title'] 이런식으로 데이터 얻어오기
                    // hotelList.append()
                }
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
        

    }
    
}
