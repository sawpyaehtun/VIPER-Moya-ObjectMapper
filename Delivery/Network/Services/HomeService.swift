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
    
    var baseURL: URL{
        return NetworkConfig.baseUrl
    }
    
    var path: String{
        switch self {
        case .getBannerList:
            return "/homeBannerList"
        case .getCategoryList:
            return "categoryList"
        }
    }
    
    var method: Moya.Method{
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}

