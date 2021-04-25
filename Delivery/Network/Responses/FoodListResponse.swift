//
//  FoodListResponse.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class FoodListResponse:  Mappable {
    
    var foodList : [FoodItemVO]?
    var statusCode : Int?
    var message : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        foodList <- map ["result"]
        statusCode <- map ["statusCode"]
        message <- map ["message"]
    }
    
}
