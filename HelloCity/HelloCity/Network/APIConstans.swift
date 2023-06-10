//
//  APIConstans.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/10.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://15.164.32.47:8000/"
    
    // MARK: - API URL LIST
    static let hotelURL = baseURL + "/hotel"
    static let activityURL = baseURL + "/activity"
    static let restaurantURL = baseURL + "/restaurant"
    static let exploreURL = baseURL + "/explore"
    
}
