//
//  EmptyView.swift
//  Stock
//
//  Created by Terry on 2022/02/18.
//

import UIKit
import SnapKit

class EmptyView: UIView {

    let descriptionLabel = NormalLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        descriptionLabel.text = "This is no any contents"
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
