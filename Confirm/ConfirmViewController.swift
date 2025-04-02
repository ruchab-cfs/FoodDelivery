//
//  ConfirmViewController.swift
//  FoodDelivery
//
//  Created by apple on 05/03/25.
//

import UIKit

class ConfirmViewController: UIViewController {
    static let id = "ConfirmViewController"
    
    private lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBarButton))
        return button
    }()
    
    @IBOutlet private weak var TableView: UITableView!
    private var items: [MenuItem]
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func setupTableView() {
        TableView.dataSource = self
        TableView.delegate = self
        TableView.register(UINib(nibName: ConfirmCell.id, bundle: nil),
                           forCellReuseIdentifier: ConfirmCell.id)
    }
    @objc private func didTapBarButton() {
        let sb = UIStoryboard(
            name: TipViewController.id,
            bundle: nil)
        let vc = sb.instantiateViewController(identifier: TipViewController.id) {[unowned self] coder in
            let tipViewController = TipViewController(coder: coder, items: items)
            return tipViewController
        }
        pushVC(vc)
    }
}

extension ConfirmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmCell.id, for: indexPath) as! ConfirmCell
        let item = items[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ConfirmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension ConfirmViewController: ConfirmCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].count += 1
        TableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        TableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
}
