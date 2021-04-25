//
//  HomeRouter.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit

protocol HomeRouting {
    func getFoodPagerVC(categoryList : [HomeCategoryItemVO]) -> FoodPagerViewController
    func navigateToCart()
}

class HomeRouter {
    var vc : UIViewController?
    
    init(vc : UIViewController) {
        self.vc = vc
    }
}

extension  HomeRouter: HomeRouting{
    func getFoodPagerVC(categoryList : [HomeCategoryItemVO]) -> FoodPagerViewController {
        let foodpagerBuilder = FoodPagerBuilder()
        foodpagerBuilder.innerTableViewDelegate = vc as? InnerTableViewScrollDelegate
        foodpagerBuilder.categoryList = categoryList
        let foodPagerVC = foodpagerBuilder.build() as! FoodPagerViewController
        foodPagerVC.foodPagerDelegate = vc as? FoodPagerViewControllerDelegate
        return foodPagerVC
    }
    
    func navigateToCart() {
        let cartPagerBuilder = CartPagerBuilder()
        let cartPagerVC = cartPagerBuilder.build()
        vc?.navigationController?.pushViewController(cartPagerVC, animated: true)
    }
}
