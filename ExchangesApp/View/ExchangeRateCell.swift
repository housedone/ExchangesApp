//
//  ExchangeRateCell.swift
//  ExchangesApp
//
//  Created by 김우성 on 7/7/25.
//

import UIKit
import SnapKit

final class ExchangeRateCell: UITableViewCell {
  
  static let id = "ExchangeRateCell"
  
  private let countryCodeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 16, weight: .medium)
    return label
  }()
  
  private let countryNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 14)
    return label
  }()
  
  private lazy var labelStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [countryCodeLabel, countryNameLabel])
    stack.axis = .vertical
    stack.alignment = .leading
    stack.spacing = 4
    return stack
  }()
  
  private let rateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 16)
    label.textAlignment = .right
    return label
  }()
  
  private let rateTrendLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.textColor = .systemGreen
    return label
  }()
  
  let favoriteButton: UIButton = {
    let button = UIButton(type: .custom)
    button.tintColor = .systemYellow
    button.setImage(UIImage(systemName: "star"), for: .normal)
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    [labelStackView, rateLabel, rateTrendLabel, favoriteButton].forEach {
      contentView.addSubview($0)
    }
    
    labelStackView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(16)
    }
    
    rateLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.greaterThanOrEqualTo(labelStackView.snp.trailing).inset(16)
      $0.trailing.equalTo(rateTrendLabel.snp.leading).offset(-8)
      $0.width.equalTo(120)
    }
    
    rateTrendLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalTo(favoriteButton.snp.leading).offset(-16)
    }
    
    favoriteButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(16)
    }
  }
  
  public func configureCell(code: String, name: String, rate: Double, isFavorite: Bool, trend: RateTrend?) {
    countryCodeLabel.text = code
    countryNameLabel.text = name
    rateLabel.text = String(format: "%.4f", rate)
    
    switch trend {
    case .up: rateTrendLabel.text = "🔼"
    case .down: rateTrendLabel.text = "🔽"
    case .same: rateTrendLabel.text = "➖"
    case .none: rateTrendLabel.text = ""
    }
    
    let imageName = isFavorite ? "star.fill" : "star"
    favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
  }
  
}
