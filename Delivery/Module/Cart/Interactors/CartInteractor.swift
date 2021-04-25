//
//  CartInteractor.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import Moya
import RxSwift
import ObjectMapper

protocol CartUserCase {
    func getSelectedItemList() -> [FoodItemVO]
    func removeItemFromSelectedList(itemId : Int, completion : @escaping () -> Void)
}

class CartInteractor {
    
}

extension  CartInteractor: CartUserCase{
    func getSelectedItemList() -> [FoodItemVO] {
        return selectedFoodList.value
    }
    
    func removeItemFromSelectedList(itemId : Int, completion : @escaping () -> Void) {
        var currentSelectedList = selectedFoodList.value
        if let index = currentSelectedList.firstIndex(where: { $0.id == itemId}){
            currentSelectedList.remove(at: index)
        }
        selectedFoodList.accept(currentSelectedList)
        completion()
    }
}
