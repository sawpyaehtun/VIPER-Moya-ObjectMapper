//
//  HomeService.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Moya

enum HomeService {
    case getBannerList
    case getCategoryList
}

extension HomeService : TargetType{
    
    var path: String{
        switch self {
        case .getBannerList:
            return "/homeBannerList"
        case .getCategoryList:
            return "categoryList"
        }
    }
    
}

