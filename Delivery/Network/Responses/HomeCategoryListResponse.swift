//
//  HomeCategoryListResponse.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class HomeCategoryListResponse:  Mappable {
    
    var categoryList : [HomeCategoryItemVO]?
    var statusCode : Int?
    var message : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        categoryList <- map ["result"]
        statusCode <- map ["statusCode"]
        message <- map ["message"]
    }
    
}
