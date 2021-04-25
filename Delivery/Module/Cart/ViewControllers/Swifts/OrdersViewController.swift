//
//  OrdersViewController.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit
import XLPagerTabStrip

class OrdersViewController: BaseTableViewController {
    
    var presenter : OrdersPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//MARK:- View
extension OrdersViewController : OrdersView {
    
}

//MARK:- IndicatorInfoProvider
extension OrdersViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Orders")
    }
}

