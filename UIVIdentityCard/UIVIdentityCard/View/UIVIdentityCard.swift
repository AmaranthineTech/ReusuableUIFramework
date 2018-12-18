//
//  UIVIdentityCard.swift
//  UIVIdentityCard
//
//  Created by Arun Patwardhan on 30/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import UIKit

/**
 The UIVIdentityCard class
 
 **Functions**
 
 `public func load(data newPerson : PersonDetailsModel)`
 
 Used to load the data for the view.
 - Author: Arun Patwardhan
 - Version: 1.0
 */
@IBDesignable
open class UIVIdentityCard: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //IBOutlets --------------------------------------------------
    @IBOutlet public weak var personIcon    : UIImageView!
    @IBOutlet public weak var personName    : UILabel!
    @IBOutlet public weak var personDetails : UITableView!
    
    //Variables --------------------------------------------------
    public var localTableData               : PersonDetailsModel!
    let nibName                             : String = "UIVIdentityCard"
    var view                                : UIView!
    let cellIdentifier                      : String = "IDCard"
    
    //Functions --------------------------------------------------
    /**
     This function does the initial setup of the view. There are multiple things happening in this file.
     1) The first thing that we do is to load the Nib file using the `nibName` we saved above. The UNIb object contains all the elements we have within the Nib file. The UINib object loads the object graph in memory but does not unarchive them. To unarchive them and get the objects loaded completely for use we have to instatiate the object and get the array of top level objects. We are however interested in the first object that is there in the array which is of type `UIView`. The reference to this view is assigned to our local `view` variable.
     2) Next we specify the bounds of our view
     3) Finally we add this view as a subview
     - important: This function does not do validation
     - requires: iOS 11 or later, the varibale that contains the name of the nib file.
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "setup view")
    func setup()
    {
        //1)
        self.view       = UINib(nibName: self.nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as? UIView
        
        //2)
        self.view.frame = bounds
        
        //3)
        self.addSubview(self.view)
    }
    
    //UITableViewDataSource Delegate Method Implementation
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = localTableData?.entryCount
        {
            return count - 2
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if nil == cell
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        switch indexPath.row
        {
        case 0:
            let formatter           = DateFormatter()
            formatter.dateStyle     = .medium
            cell?.textLabel?.text   = "Birthday\t: "    + formatter.string(from: (localTableData?.personDob)!)
        case 1:
            cell?.textLabel?.text   = "Email\t: "       + localTableData.personEmail
        case 2:
            cell?.textLabel?.text   = "Phone\t: "       + localTableData.personPhone
        case 3:
            cell?.textLabel?.text   = "Address\t: "     + localTableData.personAddress
        case 4:
            cell?.textLabel?.text   = "Company\t: "     + localTableData.personCompany
        case 5:
            cell?.textLabel?.text   = "Gender\t: "      + (localTableData.personGender?.toString())!
        case 6:
            cell?.textLabel?.text   = "Height\t: \((localTableData.personHeight)!)"
        case 7:
            cell?.textLabel?.text   = "Weight\t: \((localTableData.personWeight)!)"
        default:
            print("error")
        }
        
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        cell?.textLabel?.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return cell!
    }
    
    //Inits --------------------------------------------------
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
}

/**
 This extension adds the function to load data
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension UIVIdentityCard
{
    /**
     This function loads the data for the view
     - important: This function does not do validation
     - parameter newPerson: This is the object representing the person whose information will be displayed on the screen.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "load data")
    public func load(data newPerson : PersonDetailsModel)
    {
        if self.personIcon == nil
        {
            print("Error")
        }
        if self.personName == nil
        {
            print("Error1")
        }
        if self.personDetails == nil
        {
            print("Error2")
        }
        self.localTableData     = newPerson
        self.personIcon.image   = localTableData.personIcon
        self.personName.text    = localTableData.personName
        self.personDetails.reloadData()
    }
}
