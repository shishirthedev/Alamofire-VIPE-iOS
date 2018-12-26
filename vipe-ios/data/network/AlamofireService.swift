//
//  AlamofireService.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/21/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit
import Alamofire

private let ACCEPT = "Accept"
private let AUTHORIZATION = "Authorization"

class AlamofireService {
    
    private init(){}
   
    class func getSession()->Alamofire.SessionManager{
        let session = Alamofire.SessionManager.default
        session.adapter = RequestInterceptor()
        return session
    }
}


/*-----------------------------------
  Request Interceptor
 -----------------------------------*/
class RequestInterceptor: RequestAdapter{
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        var urlRequest = urlRequest
        
        if !Connectivity.isConnectedToInternet{
            throw NSError.NO_INTERNET
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: ACCEPT)
        urlRequest.setValue("authurization_key_here", forHTTPHeaderField: AUTHORIZATION)
        urlRequest.timeoutInterval = 20
        return urlRequest
    }
}

/*------------------------------------
  NO INTERNET ERROR
 -------------------------------------*/
extension NSError  {
    
    static func createWithLocalizedDesription(withCode code:Int = 204,localizedDescription:String) -> NSError{
        return  NSError(domain: "<your bundle id>", code:code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    static var NO_INTERNET : NSError {
        return createWithLocalizedDesription(withCode: -1009,localizedDescription:"Please check your internet connection")
    }
    
}
