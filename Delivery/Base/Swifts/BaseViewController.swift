//
//  BaseViewController.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit
import RxSwift
import RxCocoa

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

//MARK:- BaseView
extension BaseViewController : BaseView {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(error: Error) {
        print("error error error")
    }
}
