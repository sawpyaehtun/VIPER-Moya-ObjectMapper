//
//  HomeInteractor.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import Moya
import RxSwift
import ObjectMapper

protocol HomeUseCase {
    func getHomeBannerList() -> Observable<[HomeBannerItemVO]>
    func getHomeCategoryList() -> Observable<[HomeCategoryItemVO]>
}

class HomeInteractor{
    let homeProvider = MoyaProvider<HomeService>(session: AlamofireManager.session)
}

extension  HomeInteractor : HomeUseCase{
    func getHomeBannerList() -> Observable<[HomeBannerItemVO]> {
        let request = homeProvider.rx.request(.getBannerList)
        return NetworkClient.request(request: request).compactMap{ data -> [HomeBannerItemVO] in
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            if let homeBannerListRespose = Mapper<HomeBannerListResponse>().map(JSONObject: json),
               let bannerList = homeBannerListRespose.bannerList {
                return bannerList
            }
            return []
        }
    }
    
    func getHomeCategoryList() -> Observable<[HomeCategoryItemVO]> {
        let request = homeProvider.rx.request(.getCategoryList)
        return NetworkClient.request(request: request).compactMap{ data -> [HomeCategoryItemVO] in
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            if let homeCategoryListResponse = Mapper<HomeCategoryListResponse>().map(JSONObject: json),
               let categoryList = homeCategoryListResponse.categoryList {
                return categoryList
            }
            return []
        }
    }
}
