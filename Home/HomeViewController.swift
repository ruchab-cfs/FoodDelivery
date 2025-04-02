//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by apple on 05/03/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var data: [MenuItem] = []
    
    @IBOutlet private weak var TableView: UITableView!
    
    private let vcName = "ConfirmViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }
    
    private func fetchData() {
        data = Api.shared.fetchData()
    }
    
    private func setupTableView() {
        TableView.dataSource = self
        TableView.delegate = self
    }
    
    
    @IBAction func didTapCartButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(
            name: ConfirmViewController.id,
            bundle: nil)
        let items: [MenuItem] = getMenueItem()
        let vc = sb.instantiateViewController(identifier: vcName) { coder in
            let confirmViewController = ConfirmViewController(coder: coder, items: items)
            return confirmViewController
        }
        pushVC(vc)
    }
    
    private func getMenueItem() -> [MenuItem] {
        var items: [MenuItem] = []
        for item in data {
            if item.count > 0{
                items.append(item)
            }
        }
        return items
    }
}

//Mark: Table View

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.id, for: indexPath) as! HomeTableCell
        let item = data[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        //cell.nameLabel.text = ""
        return cell
    }
    
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension HomeViewController: HomeTableCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].count += 1
        TableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        TableView.reloadRows(at: [indexPath], with: .none)
    }
    
}


