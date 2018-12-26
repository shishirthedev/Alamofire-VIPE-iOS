//
//  BaseProtocols.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import Foundation

protocol NetworkViewProtocol {
    
    func networkUnavailable()
    
    func networkCallDidStarted(_ loadingMessage: String)
    
    func networkCallDidEnded()
    
    func onUnauthorized(unAuthorizedMSG: String)
    
    func onServerError(errorMSG: String)
    
    func onTimeOut(errorMSG: String)
}


protocol NetworkListenerProtocol {
    
    func onNetworkUnavailable()
    
    func onNetworkCallStarted(_ loadingMessae: String)
    
    func onNetworkCallEnded()
}

