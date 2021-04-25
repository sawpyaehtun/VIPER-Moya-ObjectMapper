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
    var baseURL: URL{
        return NetworkConfig.baseUrl
    }
    
    var path: String{
        switch self {
        case .getFoodList(let categoryId):
            return "/foodList/\(categoryId)"
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
