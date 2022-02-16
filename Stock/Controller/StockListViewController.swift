//
//  StockListViewController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import SnapKit
import UIKit

class StockListViewController: BaseViewController {
    let selfView = StockListView()
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        selfView.searchViewController.delegate = self
        selfView.searchViewController.searchResultsUpdater = self
        
        navigationItem.searchController = selfView.searchViewController
    }
}

extension StockListViewController: UISearchControllerDelegate {
    
}

extension StockListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
