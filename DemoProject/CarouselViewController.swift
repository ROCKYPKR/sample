//
//  CarouselViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let thePageVC = PageViewController()
        addChild(thePageVC)
        thePageVC.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(thePageVC.view)
        // constrain it to all 4 sides
            NSLayoutConstraint.activate([
                   thePageVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0.0),
                   thePageVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0.0),
                   thePageVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0.0),
                   thePageVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0.0),
                   ])

        thePageVC.didMove(toParent: self)



        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionSignIn(_ sender: UIButton) {

    }



}
