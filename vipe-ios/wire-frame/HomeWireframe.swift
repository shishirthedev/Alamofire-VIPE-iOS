//
//  HomeWireframe.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/20/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit
import Foundation

class HomeWireframe {
    
    static func createHomeModule(view: HomeViewController){
    
        var presenter: HomePresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        var interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        
        // IN VIEW
        view.presenter = presenter
        
        // IN PRESENTER
        presenter.view = view
        presenter.interactor = interactor

        // IN INTERACTOR
        interactor.presenter = presenter
        
        // IN ERROR HANDLER
        ErrorHandler.view = view
    }

}
