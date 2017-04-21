//
//  CustomizedTextFieldView.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/16/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit

class CustomizedTextFieldView: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor =
            UIColor(red:0.00, green:0.59, blue:0.53, alpha:1.0).CGColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
     override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
}
