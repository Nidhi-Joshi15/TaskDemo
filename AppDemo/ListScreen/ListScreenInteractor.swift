//
//  ListScreenInteractor.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
import Alamofire

class ListScreenInteractor: PresentorToInterectorProtocol {
    
    let client = APIService()
    let manager = DataManager()
    var presenter: InterectorToPresenterProtocol?
    func fetchData() {
        client.performRequest() { (response, apierror) in
            do {
                guard apierror == nil else {
                    self.presenter?.dataFetchedFailed(error: apierror)
                    return
                }
                let data: [DataModel]? = try response?.getModel()
                self.manager.save(data ?? [])
                self.presenter?.dataFetched(data: data ?? [])
            }
            catch let exception {
                let error = APIError(code: 101, description: exception.localizedDescription)
                self.presenter?.dataFetchedFailed(error: error)
            }
        }
    }
}
