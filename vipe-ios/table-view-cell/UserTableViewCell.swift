//
//  UserTableViewCell.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/21/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userId:UILabel!
    
    func setUserData(user: UserReponse){
        if let id = user.id{
            userId.text = String(id)
        }else{
            userId.text = ""
        }
    }
}
