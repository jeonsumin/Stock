//
//  StockDetailTopView.swift
//  Stock
//
//  Created by Terry on 2022/02/21.
//

import UIKit
import SnapKit


class StockDetailTopView:BaseView {
    let titleLabel = TitleLabel()
    let subTitleLabel = NormalGrayLabel()
    let currentValueTextLabel = SmallLabel()
    let currentValueValueLabel = TitleLabel()
    let investmentLabel = SmallLabel()
    let investmentValueLabel = SmallBoldLabel()
    let gainLabel = SmallLabel()
    let gainValueLabel = SmallBoldLabel()
    let annualReturnLabel = SmallLabel()
    let annualRetrunValueLabel = SmallBoldLabel()
    
    override func configureUI() {
        [
            titleLabel,
            subTitleLabel,
            currentValueTextLabel,
            currentValueValueLabel,
            investmentLabel,
            investmentValueLabel,
            gainLabel,
            gainValueLabel,
            annualReturnLabel,
            annualRetrunValueLabel
        ].forEach{ addSubview($0) }
        
        titleLabel.text = "SPY"
        subTitleLabel.text = "S&P 500 ETF"
        currentValueTextLabel.text = "Current Value (USD)"
        currentValueValueLabel.text = "5000"
        investmentLabel.text = "Investment amount"
        investmentValueLabel.text = "USD 100"
        gainLabel.text = "Gain"
        gainValueLabel.text = "+100.25 (+10.25%)"
        annualReturnLabel.text = "Annual Retrun"
        annualRetrunValueLabel.text = "10.5%"
        
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(snp.top).inset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        subTitleLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(titleLabel.snp.centerY)
        }
        currentValueTextLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        currentValueValueLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(currentValueTextLabel.snp.bottom).offset(10)
        }
        investmentLabel.snp.makeConstraints{
            $0.top.equalTo(currentValueValueLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        investmentValueLabel.snp.makeConstraints{
            $0.centerY.equalTo(investmentLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
        gainLabel.snp.makeConstraints{
            $0.top.equalTo(investmentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        gainValueLabel.snp.makeConstraints{
            $0.centerY.equalTo(gainLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
        annualReturnLabel.snp.makeConstraints{
            $0.top.equalTo(gainLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        annualRetrunValueLabel.snp.makeConstraints{
            $0.centerY.equalTo(annualReturnLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        
    }
}
