//
//  StockDetailBottomView.swift
//  Stock
//
//  Created by Terry on 2022/02/21.
//

import UIKit
import SnapKit

class StockDetailBottomView: BaseView{
    
    let investmentInputView = InputView()
    let costInputView = InputView()
    let dateInputView = InputView()
    let slider = UISlider()
    
    override func configureUI() {
        [investmentInputView,
         costInputView,
         dateInputView,
         slider].forEach{addSubview($0)}
        
        investmentInputView.configureUI(placeholder: "Enter your initial investment amount",
                                        descriptionLabelText: "initial investment amount")
        
        costInputView.configureUI(placeholder: "Monthly dollar cost averaging amount",
                                  descriptionLabelText: "Monthly dollar cost averaging amount")
        
        dateInputView.configureUI(placeholder: "Enter the initial date of investment",
                                  descriptionLabelText: "Enter the initial date of investment")
        
        investmentInputView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        costInputView.snp.makeConstraints{
            $0.top.equalTo(investmentInputView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        dateInputView.snp.makeConstraints{
            $0.top.equalTo(costInputView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        slider.snp.makeConstraints{
            $0.top.equalTo(dateInputView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    
    class InputView: BaseView{
        let textField = UITextField()
        let descriptionLabel = SmallLabel()
        let valueLabel = NormalGrayLabel()
        override func configureUI() {
            [textField,
             descriptionLabel,
             valueLabel].forEach{addSubview($0)}
            
            textField.snp.makeConstraints{
                $0.top.equalToSuperview()
                $0.leading.equalTo(snp.leading)
                $0.trailing.equalTo(snp.trailing)
            }
            descriptionLabel.snp.makeConstraints{
                $0.top.equalTo(textField.snp.bottom).offset(8)
                $0.leading.equalTo(snp.leading)
                $0.trailing.equalTo(snp.trailing)
                $0.bottom.equalTo(snp.bottom)
            }
            valueLabel.snp.makeConstraints{
                $0.centerX.equalTo(descriptionLabel.snp.centerX)
                $0.leading.equalTo(descriptionLabel.snp.trailing).offset(4)
            }
        }
        
        func configureUI(placeholder: String, descriptionLabelText: String, value: String? = "(USD)") {
            textField.placeholder = placeholder
            descriptionLabel.text = descriptionLabelText
            valueLabel.text = value
        }
        
    }
}
