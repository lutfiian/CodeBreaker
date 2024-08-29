//
//  roundViewExtension.swift
//  code
//
//  Created by Foundation-012 on 27/08/24.
//

import UIKit

extension UIView {
    func makeRounded(borderColour: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = (frame.size.width < frame.size.height) ? frame.size.width / 3.0 :
        frame.size.height / 3.0
        layer.borderColor = borderColour.cgColor
        layer.borderWidth = borderWidth
    }
}
