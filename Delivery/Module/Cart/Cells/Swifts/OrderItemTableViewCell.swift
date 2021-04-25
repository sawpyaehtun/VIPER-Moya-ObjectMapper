//
//  OrderItemTableViewCell.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

protocol OrderItemTableViewCellDelegate {
    func didTapDeleteItem(item : FoodItemVO)
}

class OrderItemTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgFoodItem: UIImageView!
    @IBOutlet weak var lblTitleFood: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    var delegate : OrderItemTableViewCellDelegate?
    var item : FoodItemVO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func bindData() {
        super.bindData()
        btnDelete.rx.tap.bind{
            if let item = self.item{
                self.delegate?.didTapDeleteItem(item: item)
            }
        }.disposed(by: disposableBag)
    }
    
    func setupCell(item : FoodItemVO){
        self.item = item
        imgFoodItem.image = UIImage(named: item.image ?? "")
        lblTitleFood.text = item.title
        lblPrice.text = "\(item.price ?? 0) usd"
    }
    
}
