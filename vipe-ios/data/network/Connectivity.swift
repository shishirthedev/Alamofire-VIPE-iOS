//
//  Connectivity.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/21/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
