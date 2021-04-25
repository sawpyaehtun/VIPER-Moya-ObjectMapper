//
//  CartViewController.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit
import XLPagerTabStrip

class CartViewController: BaseTableViewController {
    
    var presenter : CartPresentation?
    var foodList : [FoodItemVO] = []
    var totalprice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getSelectedItemList()
    }
    
    override func setupTableView() {
        super.setupTableView()
        tableView.registerForCells(cells: OrderItemTableViewCell.self,
                                   TotalPriceTableViewCell.self)
    }
}

//MARK:- View
extension CartViewController : CartView {
    func showFoodList(foodList: [FoodItemVO]) {
        
        /* clear the total price */
        totalprice = 0
        
        self.foodList = foodList
        foodList.forEach { item in
            self.totalprice += item.price ?? 0
        }
        
        tableView.isHidden = foodList.isEmpty
        tableView.reloadData()
    }
    
    func showNoData() {
        tableView.isHidden = true
        lblNoData.text = "No Item Yet!"
    }
    
    func showDeleteConfirmation(item: FoodItemVO) {
        let title = "Remove Item"
        let message = "Are you sure want to remove this \(item.title ?? "") item."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let alertConfirmAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.presenter?.removeItemFromSelectedList(itemId: item.id ?? 0)
        }
        alertController.addAction(alertConfirmAction)
        
        let alertCancelAction = UIAlertAction(title: "No", style: .cancel)
        alertController.addAction(alertCancelAction)
        
        alertController.modalPresentationStyle = .fullScreen
        self.present(alertController, animated: true, completion: nil)
    }
}

//MARK:- tableView delegate and dataSource
extension CartViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == foodList.count {
            return totalPriceCell(indexPath: indexPath)
        }
        return orderItemCell(indexPath: indexPath)
    }
}

//MARK:- cells for tableView
extension CartViewController {
    private func orderItemCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: OrderItemTableViewCell.self, indexPath: indexPath)
        cell.delegate = self
        cell.setupCell(item: foodList[indexPath.row])
        return cell
    }
    
    private func totalPriceCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: TotalPriceTableViewCell.self, indexPath: indexPath)
        cell.setupCell(totalPrice: totalprice)
        return cell
    }
}

//MARK:- IndicatorInfoProvider
extension CartViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Cart")
    }
}

//MARK:- OrderItemTableViewCellDelegate
extension CartViewController : OrderItemTableViewCellDelegate {
    func didTapDeleteItem(item: FoodItemVO) {
        presenter?.didTapDelete(item: item)
    }
}
