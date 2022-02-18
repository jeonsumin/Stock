//
//  StockListViewModel.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import RxSwift
import Combine

class StockListViewModel {

//    var loading: BehaviorSubject<Bool> = .init(value: false)
//    var errorMessage: BehaviorSubject<String?> = .init(value: nil)
//    var stocks: BehaviorSubject<[Stock]> = .init(value: [])
    @Published var stocks: [Stock] = []
    @Published var errorMessage: String?
    @Published var loading = false
    @Published var isEmpty = false
    
    var currentStocks: [Stock] = []
    
    
    var subscriber: Set<AnyCancellable> = .init()
    let usecase: StockUseCase
    
    func searchQueryChanged(query: String){
        loading = true
        usecase.fetchStocksPublisher(keywords: query).sink {[unowned self] completion in
            loading = false
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: {[unowned self] StockResult in
            self.stocks = StockResult.items
            self.currentStocks = StockResult.items
        }.store(in: &subscriber)

    }
    
    init(usecase: StockUseCase){
        self.usecase = usecase
        reduce()
    }
    
    func reduce(){
        $stocks.sink {[unowned self ] stocks in
            if stocks.count == 0 {
                self.isEmpty = true
            }else{
                self.isEmpty = false
            }
        }.store(in: &subscriber)

    }
    
//    func viewDidLoad(){
//        loading.onNext(true)
//        usecase.fetchStocksPublisher(keywords: "AMZ").sink { completion in
//            self.loading.onNext(false)
//            switch completion {
//            case .failure(let error):
//                self.errorMessage.onNext(error.localizedDescription)
//            case .finished: break
//            }
//        } receiveValue: { sockResult in
//            self.loading.onNext(false)
//            self.stocks.onNext(sockResult.items)
//        }.store(in: &subscriber)
//    }
    
}
