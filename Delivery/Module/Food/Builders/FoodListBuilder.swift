//
//  FoodListBuilder.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

class FoodListBuilder : BaseBuilder {
    var category : HomeCategoryItemVO?
    var innerTableViewScrollDelegate : InnerTableViewScrollDelegate?
    func build() -> UIViewController {
        let foodListVC = FoodListViewController.init(nibName: String(describing: BaseTableViewController.self), bundle: nil)
        foodListVC.category = category
        foodListVC.innerTableViewScrollDelegate = innerTableViewScrollDelegate
        
        let router  = FoodListRouter(vc: foodListVC)
        let interactor = FoodListInteractor()
        let presenter = FoodListPresenter(view: foodListVC, router: router, interactor: interactor)
        foodListVC.presenter = presenter
        
        return foodListVC
    }
}
