//
//  CartPagerViewController.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit
import XLPagerTabStrip
import RxCocoa
import RxSwift

class CartPagerViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var btnMenu: UIButton!
    var disposableBag = DisposeBag()
    var vcList : [UIViewController]?
        var presenter : CartPagerPresentation?
    
    override func viewDidLoad() {
        setupUI()
        bindData()
        super.viewDidLoad()
    }
    
    private func setupUI(){
                        
        self.settings.style.selectedBarHeight       = 3
        settings.style.buttonBarBackgroundColor     = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        settings.style.selectedBarBackgroundColor   = .clear
        settings.style.buttonBarItemFont            = .robotoBoldFont(size: 36)
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor.lightGray
            newCell?.label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    private func bindData(){
        btnMenu.rx.tap.bind{
            self.presenter?.didTapBackToMenu()
        }.disposed(by: disposableBag)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return vcList ?? []
    }


}

//MARK:- View
extension CartPagerViewController : CartPagerView {
    
}
