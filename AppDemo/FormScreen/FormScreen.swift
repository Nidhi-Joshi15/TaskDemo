//
//  FormScreen.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 28/06/2021.
//

import UIKit
import DropDown

class FormScreen: UIViewController {
    
    var presenter: FormScreenPresenterProtocol?
    let RISTRICTED_CHARACTERS = "<>&"
    @IBOutlet weak var textFieldEmail: UITextField?
    
    @IBOutlet weak var btnDropDown: UIButton?
    @IBOutlet weak var viewDropDown: UIView?
    @IBOutlet weak var btnAcceptance: UIButton?
    @IBOutlet weak var textViewComment: UITextView?
    
    var dropDown =  DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        manageDropDown()
        textViewComment?.delegate = self
        textViewComment?.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        textFieldEmail?.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textFieldEmail?.becomeFirstResponder()
       
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
              if self.view.frame.origin.y == 0 {
                  self.view.frame.origin.y -= keyboardSize.height
              }
         }
     }

    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
              if self.view.frame.origin.y != 0 {
                  self.view.frame.origin.y = 0
              }
         }
     }
    
    @IBAction func dropDownClicked(_ sender: Any) {
        dropDown.show()
        dropDown.selectionAction = {[unowned self] (index: Int, item: String) in
            btnDropDown?.setTitle(item, for: .normal)
        }
        dropDown.bottomOffset = CGPoint(x: viewDropDown?.frame.origin.x ?? 0, y:(viewDropDown?.frame.origin.y ?? 0) + (viewDropDown?.frame.size.height ?? 0) + 100)
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        if isValidEmail(textFieldEmail?.text ?? "") {
            presenter?.navigateToListScreen()
        } else {
            textFieldEmail?.text = ""
            showError(message: Constant.InvalidEmail)
        }
    }
    
    @IBAction func btnTickClicked(_ sender: Any) {
        let image =  presenter?.updateToggleStatus() ?? ""
        btnAcceptance?.setImage(UIImage(named: image), for: .normal)
        btnAcceptance?.setImage(UIImage(named: image), for: .highlighted)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func manageDropDown() {
        dropDown.anchorView = view
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        dropDown.direction = .bottom
        dropDown.dismissMode = .onTap
        FormScreenRouter().createModule(self)
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
}
extension FormScreen: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string =  text
        let set = CharacterSet(charactersIn: RISTRICTED_CHARACTERS)
        let inverted = set.inverted
        let filtered = string.components(separatedBy: inverted).joined(separator: "")
        return filtered != string
    }
    
}
