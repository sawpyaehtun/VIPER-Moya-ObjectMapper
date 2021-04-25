//
//  OrdersPresenter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import RxSwift

protocol OrdersPresentation {
   
}

class OrdersPresenter {
    weak var view : OrdersView?
    var router : OrdersRouting?
    var interactor : OrdersUserCase?
    
    let disposableBag = DisposeBag()
    
    init(view : OrdersView, router : OrdersRouting, interactor : OrdersUserCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension  OrdersPresenter: OrdersPresentation{

}
