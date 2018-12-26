//
//  UserReponse.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit
import ObjectMapper

private let KEY_USER_ID = "userId"
private let KEY_ID = "id"
private let KEY_TITLE = "title"
private let KEY_BODY = "body"

class UserReponse: Mappable{
    
    internal var userId: Int?
    internal var id: Int?
    internal var title: String?
    internal var body: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        userId<-map[KEY_USER_ID]
        id<-map[KEY_ID]
        title<-map[KEY_TITLE]
        body<-map[KEY_BODY]
    }
    
}

