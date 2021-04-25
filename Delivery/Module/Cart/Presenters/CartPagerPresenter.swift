//
//  CartPagerPresenter.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Foundation

protocol CartPagerPresentation {
    
    /* user interaction */
    func didTapBackToMenu()
}

class CartPagerPresenter {
    weak var view : CartPagerView?
    var router : CartPagerRouting?
    var interactor : CartPagerUseCase?
    
    init(view : CartPagerView, router : CartPagerRouting, interactor : CartPagerUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension  CartPagerPresenter: CartPagerPresentation{
    func didTapBackToMenu() {
        router?.goBackToPreviousScreen()
    }
}
