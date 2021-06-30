//
//  AppDemoProtocol.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
import  UIKit

//MARK: -PresenterToViewProtocol
protocol PresenterToViewProtocol: class {
    func showData()
    func showError(error: APIError?)
}

//MARK: - InterectorToPresenterProtocol
protocol InterectorToPresenterProtocol: class {
    func dataFetched(data: [DataModel])
    func dataFetchedFailed(error: APIError?)
}

//MARK: - PresentorToInterectorProtocol
protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchData()
}

//MARK: - ViewToPresenterProtocol
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

//MARK: - PresenterToRouterProtocol
protocol PresenterToRouterProtocol: class {
    func createModule(_ view: UIViewController)
}
