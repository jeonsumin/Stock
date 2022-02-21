//
//  StockDetailView.swift
//  Stock
//
//  Created by Terry on 2022/02/21.
//

import UIKit
import SnapKit

class StockDetailView: BaseView {
    let scrollView = UIScrollView()
    let topView = StockDetailTopView()
    let bottomView = StockDetailBottomView()
    
    
    override func configureUI() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        [topView,bottomView].forEach{scrollView.addSubview($0)}

        topView.snp.makeConstraints{
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        bottomView.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom).offset(50)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
    
}

