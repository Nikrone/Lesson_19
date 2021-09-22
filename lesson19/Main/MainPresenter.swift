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
    func removeText(for indexPath: IndexPath)
}

class MainPresenter: MainPresenterProtocol {
    
    func removeText(for indexPath: IndexPath) {
        textArray.remove(at: indexPath.row)
        view?.removeElementToTableView(to: indexPath)
    }
    
    func elementInTextArray(for indexPath: IndexPath) -> String {
        return textArray[indexPath.row]
    }
    
    func numberOfElemtntsInTextArray() -> Int {
        return textArray.count
    }
    
    func addNewText(text: String) {
        textArray.append(text)
        view?.addElementToTableView(
            to: IndexPath(
                row: numberOfElemtntsInTextArray() - 1,
                section: 0
            )
        )
    }
    
    private var textArray: [String] = []
    
    weak var view: MainViewProtocol?
    
    func viewDidLoad() {
        
    }
    
    
}
