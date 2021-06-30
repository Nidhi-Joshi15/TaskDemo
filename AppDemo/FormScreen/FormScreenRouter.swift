//
//  FormScreenRouter.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
import UIKit

class FormScreenRouter: PresenterToRouterProtocol{
    var navigation: UINavigationController?
    func createModule(_ viewController: UIViewController) {
        let presenter = FormScreenPresenter()
        let interactor = FormScreenInterector()
        let view = viewController as? FormScreen
        
        navigation = view?.navigationController ?? UINavigationController()
        view?.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interector = interactor
        interactor.presenter = presenter  
    }
    
    func navigateToListViewController() {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "ListScreenViewController") as? ListScreenViewController
        
        let presenter: ListScreenPresenterProtocol & InterectorToPresenterProtocol = ListScreenPresenter()
        let interactor: PresentorToInterectorProtocol = ListScreenInteractor()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interector = interactor
        interactor.presenter = presenter
        if let vc = view {
            navigation?.pushViewController(vc, animated: true)
        }
        
    }
}
