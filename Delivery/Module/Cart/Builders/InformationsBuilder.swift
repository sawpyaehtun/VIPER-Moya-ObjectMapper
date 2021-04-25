//
//  InformationsBuilder.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//


import UIKit

class InformationsBuilder : BaseBuilder {
    func build() -> UIViewController {
        let informationsVC = InformationsViewController.init(nibName: String(describing: BaseTableViewController.self), bundle: nil)
        let router = InformationsRouter(vc: informationsVC)
        let interactor = InformationsInteractor()
        let presenter = InformationsPresenter(view: informationsVC, router: router, interactor: interactor)
        informationsVC.presenter = presenter
        return informationsVC
    }
}
