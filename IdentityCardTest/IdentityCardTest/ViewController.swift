//
//  ViewController.swift
//  IdentityCardTest
//
//  Created by Arun Patwardhan on 05/09/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import UIKit
import UIVIdentityCard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.prepareIDCard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //IBOutlets --------------------------------------------------
    @IBOutlet weak var myIDCard: UIVIdentityCard!
    
    //Functions --------------------------------------------------
    /**
     This function prepares and loads the data that is to be shown in the custom view
     - important: This function does not do validation
     - requires: iOS 11 or later, the UIVIdentityCard framework.
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "prepares data to be shown on the ID card")
    func prepareIDCard()
    {
        let displayData : PersonDetailsModel = PersonDetailsModel(withName: "Arun Patwardhan", icon: UIImage(named: "iconHolder.png")!, birthday: Date(timeIntervalSince1970: 44_97_12_000), address: "Mumbai, Maharashtra, India", phone: "91-22-26486461", email: "arun@amaranthine.co.in", Company: "Amaranthine", height: 5.11, weight: nil, andGender: GenderType.Male)
        
        myIDCard.load(data: displayData)
    }
}




