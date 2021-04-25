//
//  CartPagerBuilder.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

class CartPagerBuilder: BaseBuilder {
    func build() -> UIViewController {
        let cartPager = CartPagerViewController.init()
        
        /* preparing for presenter */
        let router = CartPagerRouter(viewController: cartPager)
        let interactor = CartPagerInteractor()
        let presenter = CartPagerPresenter(view: cartPager, router: router, interactor: interactor)
        cartPager.presenter = presenter
        
        /* preparing viewcontrollers */
        let cartVC = CartBuilder().build()
        let ordersVC = OrdersBuilder().build()
        let informationVC = InformationsBuilder().build()
        
        let vcList = [cartVC,ordersVC,informationVC]
        cartPager.vcList = vcList
        
        return cartPager
    }
}
