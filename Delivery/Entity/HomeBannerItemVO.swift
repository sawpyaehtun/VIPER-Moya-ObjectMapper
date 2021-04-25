//
//  HomeBannerItemVO.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class HomeBannerItemVO: Mappable {
    var id : Int?
    var image : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
    }
}
