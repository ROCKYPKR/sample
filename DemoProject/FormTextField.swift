//
//  FormTextField.swift
//  DemoProject
//
//  Created by Macbook Pro on 11/14/19.
//  Copyright © 2019 Yarsa lab. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class FormTextField: UITextField {

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
            }
        }
}

