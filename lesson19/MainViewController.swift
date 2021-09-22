//
//  MainViewController.swift
//  lesson19
//
//  Created Vladislav on 22.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: View -
protocol MainViewProtocol: AnyObject {
    func updateTableView()
}

class MainViewController: UIViewController, MainViewProtocol {
//     обновление таблицы
    func updateTableView() {
        tableView.reloadData()
    }
    
    
    @IBOutlet private weak var tableView: UITableView!
    
	var presenter: MainPresenterProtocol = MainPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
        
//        инициализация таблицы
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    @IBAction private func buttonPressed() {
        presenter.addNewText(text: "123")
    }

}

//extension MainViewController: UITableViewDelegate {
//
//}




extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfElemtntsInTextArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //            из indexPath получаем номер секции и номер ряда
        cell.textLabel?.text = presenter.elementInTextArray(for: indexPath)
        return cell
    }
    
    
    
    
    
    
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 3
//        } else {
//            return 5
//        }

    }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//            let cell = UITableViewCell()
//            из indexPath получаем номер секции и номер ряда
//            cell.textLabel?.text = "Section = \(indexPath.section) Row = \(indexPath.row)"
//            return cell
//    }
    
//    добавление Header ДЕФОЛТНОГО
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section = \(section)"
//    }
    
//    добавление КАСТОМНОГО Header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.text = "Section \(section)"
//        return label
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
    
//    изменяем высоту ячейки
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
//    создание Footer
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Footer Section \(section)"
//    }
    
    
//}
