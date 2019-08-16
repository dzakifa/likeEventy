//
//  validators.swift
//  codelabs
//
//  Created by dzakifa on 07/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import Foundation

class ValidationError: Error {
    var message = String()
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case email
    case password
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator() as ValidatorConvertible
        case .password: return PasswordValidator() as ValidatorConvertible
        }
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Email is Require")}
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid e-mail Address")
            }
        } catch {
            throw ValidationError("Invalid e-mail Address")
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Password is Require")}
        return value
    }
}

