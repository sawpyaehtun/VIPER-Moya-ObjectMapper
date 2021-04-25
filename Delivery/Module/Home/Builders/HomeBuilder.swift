//
//  HomeBuilder.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit

class HomeBuilder : BaseBuilder {
    func build() -> UIViewController {
        let homeVC = HomeViewController.init()
        let router = HomeRouter(vc: homeVC)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: homeVC, router: router, interactor: interactor)
        homeVC.presenter = presenter
        return homeVC
    }
}
