//
//  GenderType.swift
//  UIVIdentityCard
//
//  Created by Arun Patwardhan on 30/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

/**
 Possible scores that can be given.
 
 *values*
 
 `Male`
 
 `Female`
 
 `NotSpecified`
 
 *functions*
 
 `func toString() -> String`
 
 Used to get the `String` version of the value
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
public enum GenderType
{
    case Male
    case Female
    case NotSpecified
}

/**
 This extension adds the Enum to String converions capability
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension GenderType
{
    /**
     This function converts from enum value to `String`
     - important: This function does not do validation
     - returns: `String`.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "convert to String")
    func toString() -> String
    {
        switch self
        {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        case .NotSpecified:
            return "Not Specified"
        }
    }
}
