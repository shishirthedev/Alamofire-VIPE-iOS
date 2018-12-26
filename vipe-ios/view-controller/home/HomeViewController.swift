//
//  HomeViewController.swift
//  Template-App-iOS
//
//  Created by Developer Shishir on 12/19/18.
//  Copyright © 2018 Shishir. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    var users:[UserReponse] = [UserReponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeWireframe.createHomeModule(view: self)
        presenter?.getUsers()
        
        userTableView.delegate = self
        userTableView.dataSource = self
    }
}
/*------------------------------------------------
    HOME VIEW PROTOCOL IMPLEMENTATION
 --------------------------------------------------*/

extension HomeViewController: HomeViewProtocol{
    
    func onUnauthorized(unAuthorizedMSG: String) {
        print(unAuthorizedMSG)
    }
    
    func onServerError(errorMSG: String) {
        print(errorMSG)
    }
    
    func onTimeOut(errorMSG: String) {
       print(errorMSG)
    }
    
    func usersDidLoaded(users: [UserReponse]) {
        self.users =  users
        self.userTableView.reloadData()
    }
    
    func networkUnavailable() {
        print("Network Unavailable")
    }
    
    func networkCallDidStarted(_ loadingMessage: String) {
        print(loadingMessage)
    }
    
    func networkCallDidEnded() {
        print("Ended")
    }
}

/*-----------------------------------------------
    USER TABLE VIEW
 ---------------------------------------------*/

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = userTableView.dequeueReusableCell(withIdentifier: "user_cell", for: indexPath) as! UserTableViewCell
        userCell.setUserData(user: users[indexPath.row])
        return userCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
