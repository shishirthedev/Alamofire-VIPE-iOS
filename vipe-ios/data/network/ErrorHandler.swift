//
//  ErrorHandler.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/22/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit

class ErrorHandler {
    
    private init(){}
    
    static var view: NetworkViewProtocol?
    
    static func  handleError(httpSatusCode: Int?, error: Error?){
        if let httpCode = httpSatusCode{
            switch httpCode{
            case NOT_FOUND:
                view?.onServerError(errorMSG: "NOT FOUND")
                break
            case UNAUTHORIZED:
                view?.onUnauthorized(unAuthorizedMSG: "UNAUTHORIZED USER")
                break
            case INTERNEL_SERVER_ERROR:
                view?.onServerError(errorMSG: "INTERNAL SERVER ERROR")
                break
            default:
                print("FAILED")
            }
        }else if let error = error as NSError?{
            if error == NSError.NO_INTERNET{
                view?.networkUnavailable()
            }
        }
    }
}
