//
//  Color+Extensions.swift
//  Weather
//
//  Created by Milena Alcântara on 14/04/24.
//

import Foundation
import UIKit

extension UIColor {
    static let theme = UIColorTheme()
}

struct UIColorTheme {
    let contrastColor = UIColor(named: "contrastColor")
    let bluePrimaryColor = UIColor(named: "bluePrimaryColor")
    let softGray = UIColor(named: "softGray")
}
