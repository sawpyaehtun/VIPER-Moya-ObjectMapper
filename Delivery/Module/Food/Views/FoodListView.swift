//
//  FoodListView.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Foundation

protocol FoodListView : BaseView {
    func showFoodList(foodList : [FoodItemVO])
}
