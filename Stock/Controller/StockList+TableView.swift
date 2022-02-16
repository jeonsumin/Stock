//
//  StockList+TableView.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit

extension StockListController: UITableViewDelegate {
    
}

extension StockListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.currentStocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.identifier, for: indexPath) as? StockCell ?? StockCell()
        let item = viewModel.currentStocks[indexPath.row]
        cell.configureUI(item: item)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
