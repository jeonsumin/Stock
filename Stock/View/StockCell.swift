//
//  StockCell.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit
import SnapKit

class StockCell: UITableViewCell {

    static let identifier = "StckCell"
    
    let symbolLabel = TitleLabel()
    let descriptionLabel = NormalGrayLabel()
    let companyNameLabel = NormalLabel()
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            alpha = 0.6
        }else {
            alpha = 1
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [symbolLabel,descriptionLabel,companyNameLabel].forEach{
            addSubview($0)
        }
        symbolLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(12)
        }
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(symbolLabel.snp.bottom).offset(12)
            $0.leading.equalTo(symbolLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(12)
        }
        companyNameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalToSuperview().dividedBy(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(item: Stock){
        symbolLabel.text = item.symbol
        descriptionLabel.text = "\(item.type ?? "") \(item.currency ?? "" )"
        companyNameLabel.text = item.name
    }
}
