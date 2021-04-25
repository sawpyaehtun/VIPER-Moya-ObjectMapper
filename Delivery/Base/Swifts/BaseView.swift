//
//  BaseView.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import Foundation

@objc protocol BaseView : class {
    @objc optional func showLoading()
    @objc optional func hideLoading()
    @objc optional func showError(error : Error)
}
