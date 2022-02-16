//
//  BaseViewController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit
import RxSwift
import Combine
class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var subscriber: Set<AnyCancellable> = .init()
    private var scrollView: UIScrollView?
    
    func enableScrollWhenKeyboardAppeared(scrollView: UIScrollView){
        self.scrollView = scrollView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillshow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillshow(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func removeListeners(){
        NotificationCenter.default.removeObserver(self)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    @objc private func keyboardWillshow(notification: Notification){
        guard let scrollView = scrollView else {
            return
        }
        
        guard let userInfo = notification.userInfo else { return }
        
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    @objc private func keyboardWillHied(notification: Notification){
        guard let scrollView = scrollView else {
            return
        }
        let contentInset: UIEdgeInsets = .zero
        scrollView.contentInset = contentInset
    }
}
