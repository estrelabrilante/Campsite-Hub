//
//  Utilities.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-04.
//

import Foundation
import UIKit
class Utilities{
static func isPasswordValid(_ password: String) -> Bool{
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
        
    }
}
