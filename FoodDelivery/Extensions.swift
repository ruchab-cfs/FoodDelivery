//
//  Extensions.swift
//  FoodDelivery
//
//  Created by apple on 20/03/25.
//

import UIKit

extension [MenuItem] {
    func calculateTotal(with tip: TipOptions) -> Double {
        var total: Double = 0
        self.forEach { item in
            let count = Double(item.count)
            let sum = item.price * count
            total += sum
        }
        return total * tip.rawValue
    }
}

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter() // Create an instance of NumberFormatter
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let value = NSNumber(value: self)
        let str = formatter.string(from: value)
        return str ?? "N/A"
    }
}
extension UIViewController {
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
