//
//  HomeProtocols.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: NetworkViewProtocol{
    
    func usersDidLoaded(users: [UserReponse])
}

protocol HomePresenterProtocol{
    var view: HomeViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    
    func getUsers()
}

protocol HomePresenterToInteractorProtocol{
    var presenter: HomeInteractorToPresenterProtocol?{get set}
    
    func pleaseGetUsers()
    
}

protocol HomeInteractorToPresenterProtocol: NetworkListenerProtocol{
    
    func onUsersLoaded(users: [UserReponse])
        
}
