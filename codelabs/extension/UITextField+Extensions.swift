//
//  UITextField+Extensions.swift
//  codelabs
//
//  Created by dzakifa on 07/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import Foundation
import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
