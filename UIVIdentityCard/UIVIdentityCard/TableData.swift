//
//  TableData.swift
//  UIVIdentityCard
//
//  Created by Arun Patwardhan on 30/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

internal struct TableData
{
    fileprivate var information : [Character : [PersonDetailsModel]] = [Character : [PersonDetailsModel]]()
    
    internal func getKeys() -> [String]
    {
        var returnKeys : [String] = [String]()
        for (key,_) in information
        {
            returnKeys.append(String(key))
        }
        return returnKeys
    }
    
    internal mutating func addPerson(with details : PersonDetailsModel)
    {
        if nil == information[details.personName.first!]
        {
            information[details.personName.first!] = [PersonDetailsModel]()
        }
        information[details.personName.first!]?.append(details)
    }
    
    internal func getPerson(_ number : Int, havingNameStartingWith char : Character) -> PersonDetailsModel?
    {
        guard nil != information[char] else { return nil }
        
        guard (information[char]?.count)! > number else { return nil }
        
        return (information[char])![number]
    }
}
