//
//  HomeView.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit

protocol HomeView : BaseView {
    func showFoodPagerView(foodPagerVC : FoodPagerViewController)
    func showHomeBannerSlider(bannerList : [HomeBannerItemVO])
    func setupFoodCountBadge(isHidden : Bool, count : Int)
}
