//
//  ReceiptViewController.swift
//  FoodDelivery
//
//  Created by apple on 05/03/25.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    static let id = "ReceiptViewController"
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let items: [MenuItem]
    private let tip: TipOptions
    private let total: Double
    
    init(coder: NSCoder, items: [MenuItem], tip: TipOptions) {
        self.items = items
        self.tip = tip
        self.total = items.calculateTotal(with: tip)
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print(items)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ReceiptViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row < items.count{
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptItemRow.id,
                for: indexPath) as! ReceiptItemRow
            let item = items[row]
            cell.configure(item: item)
            return cell
        } else if row == items.count {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptTipRow.id,
                for: indexPath) as! ReceiptTipRow
            cell.configure(tip: tip)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptTotalRow.id,
                for: indexPath) as! ReceiptTotalRow
            cell.configure(total: total)
            return cell
        }
    }
}

extension ReceiptViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
