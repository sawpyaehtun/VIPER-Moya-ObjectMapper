//
//  FoodListViewController.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit
import XLPagerTabStrip

class FoodListViewController: BaseTableViewController {
    
    var category : HomeCategoryItemVO?
    var presenter : FoodListPresentation?
    var foodList : [FoodItemVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = category?.id{
            presenter?.getFoodListByCategory(id: id)
        }
    }
    
    override func setupTableView() {
        super.setupTableView()
        tableView.registerForCells(cells: FoodItemTableViewCell.self)
    }
}

extension FoodListViewController : FoodListView {
    func showFoodList(foodList: [FoodItemVO]) {
        self.foodList = foodList
        tableView.isHidden = false
        tableView.reloadData()
    }
}

//MARK:- FoodItemTableViewCellDelegate
extension FoodListViewController : FoodItemTableViewCellDelegate{
    func didTapAddToCart(foodItem: FoodItemVO) {
        presenter?.addToCart(foodItem: foodItem)
    }
}

//MARK:- tableView delegate and dataSource
extension FoodListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return foodItemCell(indexPath: indexPath)
    }
}

//MARK:- cells for tableView
extension FoodListViewController {
    private func foodItemCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: FoodItemTableViewCell.self, indexPath: indexPath)
        cell.setupCell(item: foodList[indexPath.row])
        cell.delegate = self
        return cell
    }
}

//MARK:- IndicatorInfoProvider
extension FoodListViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let title = category?.name
        return IndicatorInfo(title: title ?? "")
    }
}
