//
//  SignupViewController.swift
//  RestaurantApp
//
//  Created by webcodegenie on 19/06/24.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet var socialsViews: [UIView]!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tfUserCompanyName: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        for socialView in socialsViews {
            socialView.layer.cornerRadius = 14.0
            socialView.clipsToBounds = true
        }
    }
    
    
    @IBAction func onRegisterBtnPressed(_ sender: Any) {
        let userEnteredName = tfUsername.text!
        let userEnteredEmail = tfUserEmail.text!
        let userEnteredPassword = tfUserPassword.text!
        let userCompanyName = tfUserCompanyName.text!
        
        
        if userEnteredEmail.isValidEmail() && userEnteredPassword.isValidPassword() && userEnteredName.isValidUsername() && userCompanyName.isValidCompanyName() {
            UserDefaults.standard.set(userEnteredEmail, forKey: "userEmail")
            UserDefaults.standard.set(userEnteredPassword, forKey: "userPassword")
            self.navigationController?.popViewController(animated: true)
        }else if userEnteredName.isValidUsername() == false {
            showAlertBox(title: "Invalid Username", message: "Username should be more than 1 character.")
        }else if userEnteredEmail.isValidEmail() == false {
            showAlertBox(title: "Invalid Email", message: "Please enter a valid email, for example : abc@xyz.com")
        }else if userEnteredPassword.isValidPassword() == false {
            showAlertBox(title: "Invalid Password", message: "Please enter a password equal or more than 4 letters or digits.")
        }else if userCompanyName.isValidCompanyName() == false {
            showAlertBox(title: "Invalid Company Name", message: "Company name should be more than 1 character.")
        }
        
        
        
        
        
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    func showAlertBox(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
