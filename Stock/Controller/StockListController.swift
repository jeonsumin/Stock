//
//  StockListViewController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import SnapKit
import UIKit
import Pure
import RxCocoa
import RxSwift
import RxCocoa

class StockListController: BaseViewController,FactoryModule {
    
    struct Dependency{
        let viewModel: StockListViewModel
    }
    
    let selfView = StockListView()
    let viewModel: StockListViewModel
    
    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        viewModel.viewDidLoad()
        bind()
    }
    
    
    func bind() {
        //        viewModel.loading.subscribe(onNext: { loading in
        //            print("loading: \(loading)")
        //        }).disposed(by: disposeBag)
        //
        //        viewModel.errorMessage.subscribe(onNext: { error in
        //            guard let error = error else { return }
        //            print("ERROR:: \(error)")
        //        }).disposed(by: disposeBag)
        //
        //        viewModel.stocks.subscribe(onNext: { stocks in
        //            print("stocks: \(stocks)")
        //        }).disposed(by: disposeBag)
        selfView.searchViewController.searchBar.rx.text.debounce(.microseconds(300), scheduler: MainScheduler.instance).subscribe(onNext: {[unowned self] text in
            guard let text = text, !text.isEmpty else { return }
            self.viewModel.searchQueryChanged(query: text)
        }).disposed(by: disposeBag)
        
        viewModel.$errorMessage.sink { errorMessage in
            guard let message = errorMessage, !message.isEmpty else {return}
            print("message: \(message)")
        }.store(in: &subscriber)
        
        viewModel.$stocks.sink { stocks in
            print("stocks: \(stocks)")
        }.store(in: &subscriber)
        
        viewModel.$loading.sink { loading in
            print("loading: \(loading)")
        }.store(in: &subscriber)
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        navigationItem.searchController = selfView.searchViewController
    }
}


