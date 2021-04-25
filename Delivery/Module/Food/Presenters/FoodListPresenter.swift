//
//  FoodPresenter.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import RxSwift

protocol FoodListPresentation {
    /* fetch data */
    func getFoodListByCategory(id : Int)
    func addToCart(foodItem : FoodItemVO)
}

class FoodListPresenter {
    weak var view : FoodListView?
    var router : FoodListRouting?
    var interactor : FoodListUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : FoodListView, router : FoodListRouting, interactor : FoodListUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension  FoodListPresenter: FoodListPresentation{
    func addToCart(foodItem: FoodItemVO) {
        interactor?.addItemToCart(foodItem: foodItem)
    }
    
    func getFoodListByCategory(id: Int) {
        view?.showLoading?()
        interactor?.getFoodListByCategory(id: id).subscribe{ foodList in
            self.view?.hideLoading?()
            self.view?.showFoodList(foodList: foodList)
        } onError: { (error) in
            self.view?.hideLoading?()
            self.view?.showError?(error: error)
        }.disposed(by: disposableBag)
    }
}
