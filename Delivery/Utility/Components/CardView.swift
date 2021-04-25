//
//  CardView.swift
//  Delivery
//
//  Created by iMac on 4/24/21.
//

import UIKit

@IBDesignable
class CardView: UIView, UIGestureRecognizerDelegate {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor : UIColor = .black
    @IBInspectable var isCircle : Bool = false
    
    // for CardView Gradiend layer
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        
        layer.cornerRadius = isCircle ? self.frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: isCircle ? self.frame.size.height / 2 : cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        gradient.frame = self.bounds
        
        super.layoutSubviews()
    }
}
