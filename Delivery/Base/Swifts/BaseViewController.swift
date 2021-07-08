//
//  BaseViewController.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView

class BaseViewController: UIViewController {
        
    var disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLanguage()
        bindData()
        setupTest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupUI(){

    }
    
    func setupLanguage(){
        
    }
        
    func bindData() {
        
    }
    
    func reloadScreen() {
        setupUI()
       
    }
    
    func setupTest(){
        
    }
    
}

// Note: this is for Loading View
extension UIViewController : NVActivityIndicatorViewable {
    
}

//MARK:- BaseView
extension BaseViewController : BaseView {
    
    func showLoading() {
        startAnimating(CGSize(width: 30, height: 30), message: "", type: .lineSpinFadeLoader)
    }
    
    func hideLoading() {
        stopAnimating()
    }
    
    func showError(error: Error) {
        print("error error error")
    }
}
