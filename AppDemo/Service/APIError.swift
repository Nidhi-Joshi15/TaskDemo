//
//  APIError.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 28/06/2021.
//

import Foundation
struct APIError {
    var code: Int?
    var description: String?
}

struct ErrorMessage {
    static let internetError = "Please check your Internet connection"
    static let noDataError = "Data Received empty from the server please try again"
}
