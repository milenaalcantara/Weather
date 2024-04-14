//
//  SetupViewProtocol.swift
//  Weather
//
//  Created by Milena Alcântara on 14/04/24.
//

import Foundation

protocol SetupView {
    func setHierarchy()
    func setConstraints()
}

extension SetupView {
    func buildLayout() {
        setHierarchy()
        setConstraints()
    }
}
