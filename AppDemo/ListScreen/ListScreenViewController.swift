//
//  ListScreenViewController.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import Foundation
import UIKit

class ListScreenViewController: UIViewController {
    var presenter: ListScreenPresenterProtocol?
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: Constant.DataCellIdentifier,
                                  bundle: nil)
        tableView?.register(textFieldCell,
                                forCellReuseIdentifier: Constant.DataCellIdentifier)
        tableView?.estimatedRowHeight = 400.0
        tableView?.rowHeight = UITableView.automaticDimension
    }
    
}
extension ListScreenViewController: PresenterToViewProtocol {
    func showError(error: APIError?) {
        let alert = UIAlertController(title: "Alert", message: error?.description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
  
    func showData() {
        tableView?.reloadData()
    }
}
extension ListScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell
                = tableView.dequeueReusableCell(withIdentifier: Constant.DataCellIdentifier) as? DataCell
        cell?.loadData(data: presenter?.getDataforIndex(indexPath.row))
        cell?.layoutIfNeeded()
        return cell ?? UITableViewCell()
        
    }
}
