//
//  roundViewButton.swift
//  code
//
//  Created by Foundation-012 on 28/08/24.
//

import UIKit
class RoundButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRounded(borderColour: .darkText, borderWidth: 1.0)
    }
}
