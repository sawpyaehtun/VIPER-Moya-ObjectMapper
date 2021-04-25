//
//  Helper.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import Foundation
import RxSwift
import RxCocoa

enum FoodType : String{
    case pizza = "Pizza"
    case sushi = "Sushi"
    case drinks = "Drinks"
}

enum DragDirection {
    case up
    case down
}

let selectedFoodList = BehaviorRelay<[FoodItemVO]>(value: [])
