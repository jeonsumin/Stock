//
//  LoadingView.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit
import SnapKit
class LoadingView: UIView {
    let spinner = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
        spinner.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
