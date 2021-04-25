//
//  UIFont + Extension.swift
//  Delivery
//
//  Created by iMac on 4/23/21.
//

import UIKit

extension UIFont {
    class func robotoFont(size: CGFloat, autoAjust: Bool = true) -> UIFont {
        return UIFont(name: "Roboto", size: size)!
    }
    
    class func robotoMediumItalicFont(size: CGFloat, autoAjust: Bool = true) -> UIFont {
        return UIFont(name: "Roboto-MediumItalic", size: size)!
    }
    
    class func robotoBoldFont(size: CGFloat, autoAjust: Bool = true) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    
    class func robotoMediumFont(size: CGFloat, autoAjust: Bool = true) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    
}
