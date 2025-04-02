//
//  ReceiptTipRow.swift
//  FoodDelivery
//
//  Created by apple on 20/03/25.
//

import UIKit

class ReceiptTipRow: UITableViewCell {
    
    static let id = "ReceiptTipRow"
    
    @IBOutlet private weak var tipLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(tip: TipOptions) {
        tipLabel.text = tip.toString()
    }
}
