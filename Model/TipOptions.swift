//
//  TipOptions.swift
//  FoodDelivery
//
//  Created by apple on 20/03/25.
//

import Foundation

enum TipOptions: Double {
    case small = 1.18
    case medium = 1.2
    case large = 1.22
    case none = 1
    
    func toString() -> String {
        switch self {
        case .small:
            return "18%"
        case .medium:
            return "20%"
        case .large:
            return "22%"
        case .none:
            return "none"
        }
    }
}
