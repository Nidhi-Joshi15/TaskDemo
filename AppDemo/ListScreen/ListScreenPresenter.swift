//
//  ListScreenPresenter.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
class ListScreenPresenter: ListScreenPresenterProtocol {
    var dataList: [DataModel]?
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func getList() -> [DataModel]? {
        return dataList
    }
    
    func getListCount() -> Int {
        return dataList?.count ?? 0
    }
    
    func getDataforIndex(_ index: Int) -> DataModelProtocol? {
        return index < getListCount() ? dataList?[index] : nil
    }
    
    func updateView() {
        
        if Utilities.ConnectedToNetwork(){
            interector?.fetchData()
        }
        else{
            view?.showError(error: APIError(code: 101, description: ErrorMessage.internetError))
        }
    }
}

extension ListScreenPresenter: InterectorToPresenterProtocol {
    
    func dataFetchedFailed(error: APIError?) {
        view?.showError(error: error)
    }
    
    func dataFetched(data: [DataModel]) {
        dataList = data
        view?.showData()
    }
}

protocol ListScreenPresenterProtocol: ViewToPresenterProtocol {
    var dataList: [DataModel]? { get set}
    
    func getListCount() -> Int
    func getList() -> [DataModel]?
    func getDataforIndex(_ index: Int) -> DataModelProtocol?
}
