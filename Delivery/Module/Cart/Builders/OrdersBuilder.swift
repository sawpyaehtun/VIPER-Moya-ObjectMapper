//
//  OrdersBuilder.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import UIKit

class OrdersBuilder: BaseBuilder {
    func build() -> UIViewController {
        let ordersVC = OrdersViewController.init(nibName: String(describing: BaseTableViewController.self), bundle: nil)
        let router = OrdersRouter(vc: ordersVC)
        let interactor = OrdersInteractor()
        let presenter = OrdersPresenter(view: ordersVC, router: router, interactor: interactor)
        ordersVC.presenter = presenter
        return ordersVC
    }
}
