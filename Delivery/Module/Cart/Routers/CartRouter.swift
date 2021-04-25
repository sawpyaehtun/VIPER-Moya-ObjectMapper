//
//  CartRouter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import UIKit

protocol CartRouting {
    
}

class CartRouter {
    var vc : UIViewController?
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  CartRouter: CartRouting {
    
}
