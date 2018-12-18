//
//  swift
//  UIVIdentityCard
//
//  Created by Arun Patwardhan on 30/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

/**
 This struct represents the data that is to be shown in the ID card
 
 **Variables**
 
 `personName`
 
 `personIcon`
 
 `personDob`
 
 Date of Birth
 
 `personAddress`
 
 `personPhone`
 
 `personEmail`
 
 `personCompany`
 
 `personHeight`
 
 `personWeight`
 
 `personGender`
 
 **Important**
 
 There is a variable with the name `entryCount`. This variable keeps tracks of the number of stored properties that exist. The value of this variable will be used to determine the number of rows in the table.
 
 The computed property `numberOfRows` is the property used to access the value of `entryCount`.
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
public struct PersonDetailsModel
{
    internal var entryCount     : Int = 7

    public var personName       : String = ""
    public var personIcon       : UIImage
    public var personDob        : Date
    public var personAddress    : String = ""
    public var personPhone      : String = ""
    public var personEmail      : String = ""
    public var personCompany    : String = ""
    
    //Variables associated with dynamic UI
    public var personHeight     : Double? = 0.0
    {
        willSet
        {
            if newValue == nil && personHeight != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personHeight == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var personWeight     : Double? = 0.0
    {
        willSet(newValue)
        {
            if newValue == nil && personWeight != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personWeight == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var personGender     : GenderType?
    {
        willSet
        {
            if newValue == nil && personGender != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personGender == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var numberOfRows : Int
    {
        return entryCount
    }
    
    public init(withName newName : String, icon newIcon : UIImage, birthday newDob : Date, address newAddress : String, phone newPhone : String, email newEmail : String, Company newCompany : String, height newHeight  : Double?, weight newWeight : Double?, andGender newGender : GenderType?)
    {
        personName      = newName
        personIcon      = newIcon
        personDob       = newDob
        personAddress   = newAddress
        personPhone     = newPhone
        personEmail     = newEmail
        personCompany   = newCompany
        if newGender != nil
        {
            entryCount += 1
        }
        if newWeight != nil
        {
            entryCount += 1
        }
        if newHeight != nil
        {
            entryCount += 1
        }
        personHeight = newHeight
        personWeight = newWeight
        personGender = newGender
    }
}

/**
 This extension adds protocol conformance for the `CustomStringConvertible` protocol.
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension PersonDetailsModel : CustomStringConvertible
{
    public var description: String {
        return """
        NAME:           \(self.personName)
        DATE OF BIRTH:  \(self.personDob)
        ADDRESS:        \(self.personAddress)
        EMAIL:          \(self.personEmail)
        PHONE:          \(self.personPhone)
        """
    }
}
