//
//  StockRepository.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Combine

protocol StockRepository {
    func fetchStockPublisher(keywords: String) -> AnyPublisher<StockResult, Error> 
    
}
