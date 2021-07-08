//
//  AlamofireManager.swift
//  Delivery
//
//  Created by Tamron iMac 001 on 7/8/21.
//

import Alamofire

struct AlamofireManager {
    
    static let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        let delegate = Session.default.delegate
        let manager = Session.init(configuration: configuration,
                                   delegate: delegate)
        return manager
    }()
    
}
