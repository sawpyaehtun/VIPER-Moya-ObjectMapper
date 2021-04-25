//
//  FoodItemVO.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class FoodItemVO: Mappable {
    var id : Int?
    var image : String?
    var title : String?
    var desc : String?
    var unit : String?
    var price : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        title   <- map["title"]
        image   <- map["image"]
        desc    <- map["description"]
        unit    <- map["unit"]
        price   <- map["price"]
    }
}
