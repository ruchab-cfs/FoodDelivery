//
//  ReceiptTotalRow.swift
//  FoodDelivery
//
//  Created by apple on 20/03/25.
//

import UIKit

class ReceiptTotalRow: UITableViewCell {
    
    static let id = "ReceiptTotalRow"

    @IBOutlet private weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure (total: Double){
        totalLabel.text = total.toCurrency()
    }
}
