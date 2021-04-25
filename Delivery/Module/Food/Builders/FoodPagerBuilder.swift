//
//  FoodPagerBuilder.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit

class FoodPagerBuilder : BaseBuilder {
    var innerTableViewDelegate : InnerTableViewScrollDelegate?
    var categoryList : [HomeCategoryItemVO] = []
    func build() -> UIViewController {
        let foodPager = FoodPagerViewController.init()
        var vcList : [UIViewController] = []
        
        categoryList.forEach { (categoryItem) in
            let foodListBuilder = FoodListBuilder()
            foodListBuilder.category = categoryItem
            foodListBuilder.innerTableViewScrollDelegate = innerTableViewDelegate
            vcList.append(foodListBuilder.build())
        }
        
        foodPager.vcList = vcList
        return foodPager
    }
}
