//
//  PageContentViewController.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import Foundation

import UIKit

class PageContentViewController: UIViewController {
    var pageIndex: Int = 0
    var photoName: String?
    @IBOutlet weak var displayImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        displayImageView.image = UIImage(named:photoName!)

    }




}
