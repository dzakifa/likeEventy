//
//  extension.swift
//  codelabs
//
//  Created by dzakifa on 05/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import UIKit

extension UITextField {
    func rightImage(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
    
    func paddingLeft(){
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 0, y: 0, width: 30, height: 30))
        leftView = iconContainerView
        leftViewMode = .always
    }
}
