//
//  APIEndPoint.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 28/06/2021.
//

import Foundation
struct API {
    
    static let baseUrl = "https://jsonplaceholder.typicode.com/posts"
}

class APIEndPoint {
    
    var baseUrl: String {
        return API.baseUrl
    }
    
    var params: String {
        return ""
    }
        
    var httpMethod: HttpMethod {
        return .get
    }
    
    var url : String {
        return baseUrl
    }
}

enum HttpMethod :String {
    case post = "POST"
    case get = "GET"
}
