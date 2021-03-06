//
//  HomeCategoryItemVO.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class HomeCategoryItemVO: Mappable {
    var id : Int?
    var name : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
