//
//  HomePresenter.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    
    func getUsers() {
        interactor?.pleaseGetUsers()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol{
    
    func onUsersLoaded(users: [UserReponse]) {
        view?.usersDidLoaded(users: users)
    }
    
    func onNetworkUnavailable() {
        view?.networkUnavailable()
    }
    
    func onNetworkCallStarted(_ loadingMessae: String) {
        view?.networkCallDidStarted(loadingMessae)
    }
    
    func onNetworkCallEnded() {
        view?.networkCallDidEnded()
    }
    
}
