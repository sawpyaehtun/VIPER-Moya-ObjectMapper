//
//  FoodListRouter.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

protocol FoodListRouting {
    
}

class FoodListRouter {
    var vc : UIViewController?
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  FoodListRouter: FoodListRouting{
    
}
