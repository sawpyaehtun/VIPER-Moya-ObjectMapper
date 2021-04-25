//
//  FoodItemTableViewCell.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

protocol FoodItemTableViewCellDelegate {
    func didTapAddToCart(foodItem : FoodItemVO)
}

class FoodItemTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodTitle: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodCount: UILabel!
    @IBOutlet weak var btnAdd: RoundedCornerUIButton!
    
    var delegate : FoodItemTableViewCellDelegate?
    var foodItem : FoodItemVO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func bindData() {
        super.bindData()
        btnAdd.rx.tap.bind{
            self.startAddToCartAnimation()
        }.disposed(by: disposableBag)
    }
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    func setupCell(item : FoodItemVO){
        self.foodItem = item
        imgFood.image = UIImage(named: item.image ?? "")
        lblFoodTitle.text = item.title
        lblFoodDescription.text = item.desc
        lblFoodCount.text = item.unit
        btnAdd.setTitle("\(item.price ?? 0) usd", for: .normal)
    }
    
    private func startAddToCartAnimation(){
        UIView.animate(withDuration: 0.1) {
            self.btnAdd.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } completion: { (_) in
            self.btnAdd.setTitle("added + 1", for: .normal)
            self.btnAdd.setTitleColor(.white, for: .normal)
            UIView.animate(withDuration: 0.1, delay: 0.3) {
                self.btnAdd.backgroundColor = .black
            } completion: { (_) in
                self.btnAdd.setTitle("\(self.foodItem?.price ?? 0) usd", for: .normal)
                self.btnAdd.setTitleColor(.lightGray, for: .normal)
                if let foodItem = self.foodItem{
                    self.delegate?.didTapAddToCart(foodItem : foodItem)
                }
            }
        }

    }
    
}
    
