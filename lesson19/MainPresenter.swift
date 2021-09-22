//
//  MainPresenter.swift
//  lesson19
//
//  Created Vladislav on 22.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation


// MARK: Presenter -
protocol MainPresenterProtocol {
	var view: MainViewProtocol? { get set }
    func viewDidLoad()
    
    func addNewText(text: String)
    func numberOfElemtntsInTextArray() -> Int
    func elementInTextArray(for indexPath: IndexPath) -> String
}

class MainPresenter: MainPresenterProtocol {
    func elementInTextArray(for indexPath: IndexPath) -> String {
        return textArray[indexPath.row]
    }
    
    func numberOfElemtntsInTextArray() -> Int {
        return textArray.count
    }
    
    func addNewText(text: String) {
        textArray.append(text)
        view?.updateTableView()
    }
    
    private var textArray: [String] = []
    
    weak var view: MainViewProtocol?

    func viewDidLoad() {

    }
    
    
}
