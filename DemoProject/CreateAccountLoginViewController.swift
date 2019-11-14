//
//  CreateAccountLoginViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import UIKit

class CreateAccountLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionCreateAccount(_ sender: UIButton) {
        let controller=storyboard?.instantiateViewController(withIdentifier:"RegistrationViewController") as! RegistrationViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller,animated: true, completion: nil)

    }

    @IBAction func actionLogin(_ sender: UIButton) {
        let controller=storyboard?.instantiateViewController(withIdentifier:"LoginViewController") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller,animated: true, completion: nil)

        
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
