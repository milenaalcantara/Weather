//
//  HourlyForecastCollectionViewCell.swift
//  Weather
//
//  Created by Milena Alcântara on 14/04/24.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HourlyForecastCell"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:00"
        label.textColor = UIColor.theme.contrastColor
        label.font = UIFont.systemFont(
            ofSize: 10,
            weight: .semibold
        )
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25ºC"
        label.textColor = UIColor.theme.contrastColor
        label.font = UIFont.systemFont(
            ofSize: 14,
            weight: .semibold
        )
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            hourLabel,
            iconImageView,
            temperatureLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.theme.contrastColor?.cgColor
        stackView.layer.cornerRadius = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 8,
            leading: 8,
            bottom: 8,
            trailing: 8
        )
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?) {
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
}

extension HourlyForecastCollectionViewCell: SetupView {
    func setHierarchy() {
        contentView.addSubview(stackView)
    }
    
    func setConstraints() {
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 33),
        ])
    }
}
