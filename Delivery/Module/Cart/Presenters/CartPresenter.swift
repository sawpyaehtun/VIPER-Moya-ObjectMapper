//
//  CartPresenter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import RxSwift

protocol CartPresentation {
    /* fetch data */
    func getSelectedItemList()
    
    /* user interaction*/
    func didTapDelete(item : FoodItemVO)
    func removeItemFromSelectedList(itemId : Int)
    
}

class CartPresenter {
    weak var view : CartView?
    var router : CartRouting?
    var interactor : CartUserCase?
    
    let disposableBag = DisposeBag()
    
    init(view : CartView, router : CartRouting, interactor : CartInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension  CartPresenter: CartPresentation{
    func getSelectedItemList() {
        if let itemList = interactor?.getSelectedItemList(),
           !itemList.isEmpty{
            view?.showFoodList(foodList: itemList)
        } else {
            view?.showNoData()
        }
    }
    
    func didTapDelete(item: FoodItemVO) {
        view?.showDeleteConfirmation(item: item)
    }
    
    func removeItemFromSelectedList(itemId: Int) {
        interactor?.removeItemFromSelectedList(itemId: itemId, completion: {
            self.getSelectedItemList()
        })
    }
    
}
