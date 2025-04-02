//
//  TipViewController.swift
//  FoodDelivery
//
//  Created by apple on 05/03/25.
//

import UIKit

class TipViewController: UIViewController {
    
    static let id = "TipViewController"
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBarButton))
        return button
    }()
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var smallTipButton: UIButton!
    @IBOutlet private weak var mediumTipButton: UIButton!
    @IBOutlet private weak var largeTipButton: UIButton!
    @IBOutlet private weak var skipButton: UIButton!
    lazy var tipSelections: [UIButton] = [
        smallTipButton,
        mediumTipButton,
        largeTipButton,
        skipButton
    ]
    var tipAmount: TipOptions = .small
    
    let items: [MenuItem]
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 15
        stackView.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 20
        }
        smallTipButton.isSelected = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait {
            stackView.axis = .vertical
        } else if orientation.isLandscape {
            stackView.axis = .horizontal
            }
    }
    
    @objc func didTapBarButton() {
        let sb = UIStoryboard(
            name: ReceiptViewController.id,
            bundle: nil)
        let vc = sb.instantiateViewController(identifier: ReceiptViewController.id) {[unowned self] coder in
            let receiptViewController = ReceiptViewController(coder: coder, items: items, tip: tipAmount)
            return receiptViewController
        }
        pushVC(vc)
    }
    
    func deselectButton() {
        tipSelections.forEach { button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSmallTip() {
        deselectButton()
        smallTipButton.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didTapMediumTip() {
        deselectButton()
        mediumTipButton.isSelected = true
        tipAmount = .medium
    }
    
    @IBAction func didTapLargeTip() {
        deselectButton()
        largeTipButton.isSelected = true
        tipAmount = .large
    }
    
    @IBAction func didTapSkip() {
        deselectButton()
        skipButton.isSelected = true
        tipAmount = .none
    }
    
}
