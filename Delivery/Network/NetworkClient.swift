//
//  NetworkClient.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Foundation
import RxSwift
import Moya
class NetworkClient {
    
    static func request(request : Single<Response>) -> Observable<Data>{
        /*! Note :
         *  there will be connection checking
         */
        return Observable.create { observer in
            request.subscribe{ event in
                switch event {
                case .success(let response):
                    observer.onNext(response.data)
                    observer.onCompleted()
                case .error(let error):
                    observer.onError(error)
                }
            }
        }
    }
    
}
