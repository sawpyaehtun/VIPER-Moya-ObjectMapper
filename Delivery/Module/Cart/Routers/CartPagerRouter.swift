//
//  CartPagerRouter.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

protocol CartPagerRouting {
    func goBackToPreviousScreen()
}

class CartPagerRouter {
    var viewController : UIViewController?
    
    init(viewController : UIViewController) {
        self.viewController = viewController
    }
}

extension  CartPagerRouter: CartPagerRouting{
    func goBackToPreviousScreen() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
