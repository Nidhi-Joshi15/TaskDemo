//
//  FormScreenInterector.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
class FormScreenInterector: FormScreenInterectorProtocol {
    var presenter: FormScreenPresenterProtocol?
    // save coredata
}


protocol  FormScreenInterectorProtocol {
    var presenter: FormScreenPresenterProtocol? { get set }
}
