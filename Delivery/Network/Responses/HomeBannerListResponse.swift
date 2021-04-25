//
//  HomeBannerListResponse.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import ObjectMapper

class HomeBannerListResponse:  Mappable {
    
    var bannerList : [HomeBannerItemVO]?
    var statusCode : Int?
    var message : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bannerList <- map ["result"]
        statusCode <- map ["statusCode"]
        message <- map ["message"]
    }
    
}
