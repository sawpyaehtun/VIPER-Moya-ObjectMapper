//
//  InformationsViewController.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit
import XLPagerTabStrip

class InformationsViewController: BaseTableViewController {
    
    var presenter : InformationsPresentation?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

//MARK:- View
extension InformationsViewController : InformationsView {
    
}

//MARK:- IndicatorInfoProvider
extension InformationsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Informations")
    }
}
