//
//  OrdersRouter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import UIKit

protocol OrdersRouting {
    
}

class OrdersRouter {
    var vc : UIViewController?
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  OrdersRouter: OrdersRouting {
    
}

