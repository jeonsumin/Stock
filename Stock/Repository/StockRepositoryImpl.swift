//
//  StockRepositoryImpl.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Combine
import Foundation

class StockRepositoryImpl: StockRepository {
    var apiKey: String = "78NIHQJ92C353EDQ"
    let decoder = JSONDecoder()
    
    func fetchStockPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            let error = URLError(.badURL)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map{$0.data}.decode(type: StockResult.self, decoder: decoder).receive(on: RunLoop.main).eraseToAnyPublisher()
    }
    
}
