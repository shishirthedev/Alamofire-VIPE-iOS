//
//  HomeInteractor.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    func pleaseGetUsers() {
        presenter?.onNetworkCallStarted("Loading Posts...")
        AlamofireService.getSession()
            .request(POST_API)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[UserReponse]>) in
                self.presenter?.onNetworkCallEnded()
                guard let users = response.value else{
                    ErrorHandler.handleError(httpSatusCode: response.response?.statusCode, error: response.error)
                    return
                }
                self.presenter?.onUsersLoaded(users: users)
        }
    }
}
