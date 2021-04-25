//
//  TotalPriceTableViewCell.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

class TotalPriceTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTotalPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(totalPrice : Int){
        lblTotalPrice.text = "\(totalPrice) usd"
    }
    
}
