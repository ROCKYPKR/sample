//
//  RegistrationViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()

        // Do any additional setup after loading the view.
    }

    func setUpDelegate(){
        fullName.delegate=self
        email.delegate=self
        password.delegate=self
        confirmPassword.delegate=self
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

   @objc func keyboardWillShow(notification: NSNotification) {

    if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 100
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
       if self.view.frame.origin.y != 0 {
           self.view.frame.origin.y = 0
       }
    }
    

    @IBAction func actionCreateAccount(_ sender: UIButton) {
        if self.checkInputEmpty(){
            showMessageDialog(message: "Please check all Input")

        }else{
            if !validatePassword(password:password.text!, confirmPassword: confirmPassword.text!){
                 showMessageDialog(message:"Password dont match")
            }else if !isValidEmail(emailStr:email.text!){
                showMessageDialog(message:"Please Enter Valid Email")
            }else{
                //create account
                let controllerLogin=storyboard?.instantiateViewController(identifier:"VerificationViewController") as! VerificationViewController
                self.present(controllerLogin, animated: true, completion: nil)
            }

        }

    }

    func showMessageDialog(message:String){
        let alert=UIAlertController(title:nil, message:message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (alertAction) in

        }))
        self.present(alert, animated: true, completion: nil)
    }
    
     func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }


    func checkInputEmpty()->Bool{
        if fullName.text!.isEmpty{
            return true
        }else if email.text!.isEmpty{
            return true

        }else if password.text!.isEmpty{
            return true

        }else if confirmPassword .text!.isEmpty{
            return true

        }else{
            return false
        }
    }

    func validatePassword(password:String,confirmPassword:String)->Bool{
        if password == confirmPassword{
            return true
        }
        return false

    }


}
extension RegistrationViewController:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //textField code
        textField.resignFirstResponder()  //if desired

        return true
    }

}
