//
//  TargetType + Extension.swift
//  Delivery
//
//  Created by Tamron iMac 001 on 7/8/21.
//

import Moya

extension TargetType{
    var baseURL: URL{
        return NetworkConfig.baseUrl
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var method: Moya.Method{
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
     var task: Task {
        return .requestPlain
        
//        case let .updateUser(_, firstName, lastName):  // Always sends parameters in URL, regardless of which HTTP method is used
//        return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//        return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
    }
    
}
