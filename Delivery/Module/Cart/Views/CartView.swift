//
//  CartView.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import Foundation

protocol CartView : BaseView {
    func showFoodList(foodList : [FoodItemVO])
    func showNoData()
    func showDeleteConfirmation(item : FoodItemVO)
}
