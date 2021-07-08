//
//  HomeViewController.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit
import FSPagerView

class HomeViewController: BaseViewController {

    @IBOutlet weak var topViewContainer: UIView!
    @IBOutlet weak var bottomViewContainer: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var lblScreenSubTitle: UILabel!
    @IBOutlet weak var btnCart: RoundedCornerUIButton!
    @IBOutlet weak var viewBadge: CardView!
    @IBOutlet weak var lblFoodCount: UILabel!
    @IBOutlet weak var bottomConstraintBtnCart: NSLayoutConstraint!
    
    var presenter : HomePresentation?
    var foodPagerVC : FoodPagerViewController!
    
    var vcList : [UIViewController]?
    var homeBannerList : [HomeBannerItemVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getHomeBannerList()
        presenter?.getCategoryList()
        presenter?.subscribeSelectedItemList()
    }
    
    override func setupUI(){
        headerViewHeightConstraint.constant = topViewInitialHeight
        
        lblScreenTitle.text = "Kazarov"
        lblScreenSubTitle.text = "delivery"
        
        addPanGestureToTopView()
        setupBannerPagerView()
        
        btnCart.alpha = 0
        viewBadge.alpha = 0
    }
    
    override func bindData() {
        super.bindData()
        
        btnCart.rx.tap.bind{
            self.presenter?.didTapBtnCart()
        }.disposed(by: disposableBag)
    }
    
    private func setupBannerPagerView(){
        pageControl.backgroundColor = .clear
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.automaticSlidingInterval = 5.0
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func pinPagingViewControllerToBottomView() {

        bottomViewContainer.translatesAutoresizingMaskIntoConstraints = false
        foodPagerVC.view.translatesAutoresizingMaskIntoConstraints = false

        foodPagerVC.view.leadingAnchor.constraint(equalTo: bottomViewContainer.leadingAnchor).isActive = true
        foodPagerVC.view.trailingAnchor.constraint(equalTo: bottomViewContainer.trailingAnchor).isActive = true
        foodPagerVC.view.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor).isActive = true
        foodPagerVC.view.bottomAnchor.constraint(equalTo: bottomViewContainer.bottomAnchor).isActive = true
    }
    
        
    private func addPanGestureToTopView() {
        
        let topViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topViewMoved))
        
        topViewContainer.isUserInteractionEnabled = true
        topViewContainer.addGestureRecognizer(topViewPanGesture)
        
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
            innerTableViewDidScroll(withDistance: dragYDiff)
            
        case .ended:
            
            innerTableViewScrollEnded(withScrollDirection: dragDirection)
            
        default: return
            
        }
    }
    
    private func setupCartButton(isShow : Bool){
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomConstraintBtnCart.constant = isShow ? 40 : 20
            self.btnCart.alpha = isShow ? 1 : 0
            self.viewBadge.alpha = isShow ? 1 : 0
        })
    }
}

//MARK:- View
extension HomeViewController : HomeView {
    func showHomeBannerSlider(bannerList: [HomeBannerItemVO]) {
        self.homeBannerList = bannerList
        pageControl.numberOfPages = bannerList.count
        pagerView.reloadData()
    }
    
    func showFoodPagerView(foodPagerVC: FoodPagerViewController) {
        self.foodPagerVC = foodPagerVC
        bottomViewContainer.addSubview(foodPagerVC.view)
        pinPagingViewControllerToBottomView()
    }
    
    func setupFoodCountBadge(isHidden: Bool, count: Int) {
        viewBadge.isHidden = isHidden
        lblFoodCount.text = "\(count)"
    }
}

extension HomeViewController: InnerTableViewScrollDelegate {
    
    func didEndScroll() {
        if currentHeaderHeight <= 0 {
            setupCartButton(isShow: true)
        }
    }
    
    
    var currentHeaderHeight: CGFloat {
        
        return headerViewHeightConstraint.constant
    }
    
    func innerTableViewDidScroll(withDistance scrollDistance: CGFloat) {
        
        headerViewHeightConstraint.constant -= scrollDistance
        
        /* Don't restrict the downward scroll.
         
         if headerViewHeightConstraint.constant > topViewInitialHeight {
         
         headerViewHeightConstraint.constant = topViewInitialHeight
         }
         
         */
        
        if headerViewHeightConstraint.constant < topViewFinalHeight {
            
            headerViewHeightConstraint.constant = topViewFinalHeight
        }
    }
    
    func innerTableViewScrollEnded(withScrollDirection scrollDirection: DragDirection) {
        
        let topViewHeight = headerViewHeightConstraint.constant
        
        /*
         *  Scroll is not restricted.
         *  So this check might cause the view to get stuck in the header height is greater than initial height.
         
         if topViewHeight >= topViewInitialHeight || topViewHeight <= topViewFinalHeight { return }
         
         */
        
        if topViewHeight <= topViewFinalHeight + 20 {
            
            scrollToFinalView()
            
        } else if topViewHeight <= topViewInitialHeight - 20 {
            
            switch scrollDirection {
            
            case .down: scrollToInitialView()
            case .up: scrollToFinalView()
                
            }
            
        } else {
            
            scrollToInitialView()
        }
    }
    
    func scrollToInitialView() {
        
        let topViewCurrentHeight = topViewContainer.frame.height
        
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewInitialHeight)
        
        var time = distanceToBeMoved / 500
        
        if time < 0.25 {
            
            time = 0.25
        }
        
        headerViewHeightConstraint.constant = topViewInitialHeight
        setupCartButton(isShow: false)
        UIView.animate(withDuration: TimeInterval(time), animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func scrollToFinalView() {
        
        let topViewCurrentHeight = topViewContainer.frame.height
        
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewFinalHeight)
        
        var time = distanceToBeMoved / 500
        
        if time < 0.25 {
            
            time = 0.25
        }
        
        self.headerViewHeightConstraint.constant = topViewFinalHeight
        setupCartButton(isShow: true)
        UIView.animate(withDuration: TimeInterval(time), animations: {
            self.view.layoutIfNeeded()
            
        })
    }
}

extension HomeViewController : FSPagerViewDelegate , FSPagerViewDataSource {
    
    // MARK:- FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return homeBannerList.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: homeBannerList[index].image ?? "")
        
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    override func showError(error: Error) {
        print("Can't connected to server or something")
    }
        
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
}


