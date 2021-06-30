//
//  FormScreenPresenter.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation

enum SelectToggle {
    case selected
    case unselected
}

class FormScreenPresenter: FormScreenPresenterProtocol {
    var toggleTickStatus: SelectToggle
    
    var view: FormScreen?
    
    var router: FormScreenRouter?
    
    var interector: FormScreenInterector?
    init() {
        self.interector = FormScreenInterector()
        toggleTickStatus = .unselected
        router?.navigation = view?.navigationController
    }
    
    func updateToggleStatus() -> String {
        self.toggleTickStatus = toggleTickStatus == .unselected ? .selected : .unselected
        return toggleTickStatus == SelectToggle.selected ? Constant.imageSet.unCheck.rawValue : Constant.imageSet.check.rawValue
    }
    
    func getToggleStatus() -> SelectToggle {
        return toggleTickStatus
    }
    func navigateToListScreen() {
        router?.navigateToListViewController()
    }
    
    func getList() -> [String] {
        return ["Dubai", "Abu Dhabi", "Sarjah"]
    }
}


protocol FormScreenPresenterProtocol {
    var toggleTickStatus: SelectToggle { get set }
    var interector: FormScreenInterector? {get set}
    var view: FormScreen? { get set }
    var router: FormScreenRouter? { get set }
    
    
    func updateToggleStatus() -> String
    func navigateToListScreen()
    func getList() -> [String]
    func getToggleStatus() -> SelectToggle
}
