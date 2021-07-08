//
//  FoodService.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Moya

enum FoodService {
    case getFoodList(_ categoryId : Int)
}

extension FoodService : TargetType {
    
    var path: String{
        switch self {
        case .getFoodList(let categoryId):
            return "/foodList/\(categoryId)"
        }
    }
    
}
