//
//  InformationsRouter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import UIKit

protocol InformationsRouting {
    
}

class InformationsRouter {
    var vc : UIViewController?
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  InformationsRouter: InformationsRouting {
    
}
