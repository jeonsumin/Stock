//
//  StockListView.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit
import SnapKit

class StockListView: BaseView {
    let tableView : UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let searchViewController: UISearchController = {
       let view = UISearchController(searchResultsController: nil)
        view.searchBar.placeholder = "Enter a compony name or symbol"
        view.obscuresBackgroundDuringPresentation = false
        return view
    }()
    
    let loadingView = LoadingView()
    
    override func configureUI() {
        [
            tableView,
            loadingView
        ].forEach{
            addSubview($0)
            $0.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
        

        
    }
}
