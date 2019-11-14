//
//  LoginViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        validateUserNameAndPassword()
    }
    
    func validateUserNameAndPassword(){
        let userNameValue=userName.text!
        let passwordValue=password.text!
        if userNameValue.isEmpty{
            showMessageDialog(message: "Enter user name")
            return
        }else if passwordValue.isEmpty{
            showMessageDialog(message: "Enter password")
            return
        }else{
            if (passwordValue == "arjun1234" && userNameValue == "arjun@gmail.com"){
                showMessageDialog(message:"Login success")
            }else{
                showMessageDialog(message:"Username or password incorrect")
            }
            
        }
        
    }
    
    func showMessageDialog(message:String){
          let alert=UIAlertController(title:nil, message:message, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (alertAction) in

          }))
          self.present(alert, animated: true, completion: nil)
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
