//
//  FoodPagerViewController.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit
import XLPagerTabStrip

protocol FoodPagerViewControllerDelegate {
    func didScroll(distance: CGFloat)
    func didEndScroll(scrollDirection: DragDirection)
}

class FoodPagerViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var viewTopContainer: UIView!
    
    var vcList : [UIViewController]?
    var foodPagerDelegate : FoodPagerViewControllerDelegate?

    override func viewDidLoad() {
        setupUI()
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
        
        addPanGestureToTopViewContainer()
    }
    
    private func addPanGestureToTopViewContainer() {
        let topViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topViewMoved))
        viewTopContainer.isUserInteractionEnabled = true
        viewTopContainer.addGestureRecognizer(topViewPanGesture)
    }
    
    var dragInitialY: CGFloat = 0
    var dragPreviousY: CGFloat = 0
    var dragDirection: DragDirection = .up
    
    @objc func topViewMoved(_ gesture: UIPanGestureRecognizer) {
        
        var dragYDiff : CGFloat
        
        switch gesture.state {
        
        case .began:
            dragInitialY = gesture.location(in: self.view).y
            dragPreviousY = dragInitialY
            
        case .changed:
            
            let dragCurrentY = gesture.location(in: self.view).y
            dragYDiff = dragPreviousY - dragCurrentY
            dragPreviousY = dragCurrentY
            dragDirection = dragYDiff < 0 ? .down : .up
            foodPagerDelegate?.didScroll(distance: dragYDiff)
//            innerTableViewDidScroll(withDistance: dragYDiff)
            
        case .ended:
                foodPagerDelegate?.didEndScroll(scrollDirection: dragDirection)
//            innerTableViewScrollEnded(withScrollDirection: dragDirection)
            
        default: return
            
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return vcList ?? []
    }


}
