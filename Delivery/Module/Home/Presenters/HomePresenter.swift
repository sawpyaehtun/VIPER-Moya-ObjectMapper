//
//  HomePresenter.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import Foundation
import RxSwift

protocol HomePresentation {
    
    /* fetch data */
    func getHomeBannerList()
    func getCategoryList()
    func subscribeSelectedItemList()
    
    /* user interaction */
    func didTapBtnCart()
}

class HomePresenter {
    weak var view : HomeView?
    var router : HomeRouting?
    var interactor : HomeUseCase?
    
    let disposableBag = DisposeBag()
    
    init(view : HomeView, router : HomeRouting, interactor : HomeUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension  HomePresenter: HomePresentation{
    
    func getCategoryList() {
        view?.showLoading?()
        interactor?.getHomeCategoryList().subscribe{ categoryList in
            self.view?.hideLoading?()
            if let foodPagerView = self.router?.getFoodPagerVC(categoryList: categoryList){
                self.view?.showFoodPagerView(foodPagerVC: foodPagerView)
            }
        }onError: { (error) in
            self.view?.hideLoading?()
            self.view?.showError?(error: error)
        }.disposed(by: disposableBag)
    }
    
    func getHomeBannerList() {
        view?.showLoading?()
        interactor?.getHomeBannerList().subscribe{ homeBannerList in
            self.view?.hideLoading?()
            self.view?.showHomeBannerSlider(bannerList: homeBannerList)
        }onError: { (error) in
            self.view?.hideLoading?()
            self.view?.showError?(error: error)
        }.disposed(by: disposableBag)
    }
    
    func didTapBtnCart() {
        router?.navigateToCart()
    }
    
    func subscribeSelectedItemList(){
        selectedFoodList.bind{
            self.didChangeSavedFoodList(foodItemList: $0)
        }.disposed(by: disposableBag)
    }
    
    private func didChangeSavedFoodList(foodItemList : [FoodItemVO]) {
        view?.setupFoodCountBadge(isHidden: foodItemList.isEmpty, count: foodItemList.count)
    }
    
}
