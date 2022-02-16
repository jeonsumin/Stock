//
//  StockUseCase.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Foundation
import Combine

class StockUseCase {
    
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult,Error> {
        return stockRepository.fetchStockPublisher(keywords: keywords)
    }
    
    private let stockRepository: StockRepository
    
    init(stockRepository: StockRepository){
        self.stockRepository = stockRepository
    }
}
