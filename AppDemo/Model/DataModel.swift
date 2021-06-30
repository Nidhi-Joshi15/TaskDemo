//
//  DataModel.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
import Combine

class DataModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

protocol DataModelProtocol {
    var dataTitle: String {get}
    var dataDetail: String {get}
}


extension DataModel: DataModelProtocol {
   
    var dataTitle: String {
        return title
    }
    
    var dataDetail: String {
        return body
    }
}
