//
//  CartBuilder.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import UIKit

class CartBuilder: BaseBuilder {
    func build() -> UIViewController {
        let cartVC = CartViewController.init(nibName: String(describing: BaseTableViewController.self), bundle: nil)
        let router = CartRouter(vc: cartVC)
        let interactor = CartInteractor()
        let presenter = CartPresenter(view: cartVC, router: router, interactor: interactor)
        cartVC.presenter = presenter
        return cartVC
    }
}
