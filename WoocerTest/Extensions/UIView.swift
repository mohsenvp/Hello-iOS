//
//  UIView.swift
//  WoocerTest
//
//  Created by Mohsen on 12/13/21.
//

import UIKit

// Mark: -Round
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        layoutIfNeeded()
        sizeToFit()
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

