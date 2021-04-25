//
//  FoodListInteractor.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Moya
import RxSwift
import ObjectMapper

protocol FoodListUseCase {
    func getFoodListByCategory(id : Int) -> Observable<[FoodItemVO]>
    func addItemToCart(foodItem : FoodItemVO)
}

class FoodListInteractor {
    let foodProvider = MoyaProvider<FoodService>()
}

extension  FoodListInteractor: FoodListUseCase{
    func getFoodListByCategory(id: Int) -> Observable<[FoodItemVO]> {
        let request = foodProvider.rx.request(.getFoodList(id))
        return NetworkClient.request(request: request).compactMap{ data -> [FoodItemVO] in
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            if let foodListRespose = Mapper<FoodListResponse>().map(JSONObject: json),
               let foodList = foodListRespose.foodList {
                return foodList
            }
            return []
        }
    }
    
    func addItemToCart(foodItem: FoodItemVO) {
        selectedFoodList.accept(selectedFoodList.value + [foodItem])
    }
}
