//
//  PaymentTypeTableViewCell.swift
//  ShopApp
//
//  Created by Evgeniy Antonov on 12/29/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

class PaymentTypeTableViewCell: UITableViewCell {
    @IBOutlet private weak var paymentTypeLabel: UILabel!
    @IBOutlet private weak var paymentTypeImage: UIImageView!
    @IBOutlet private weak var selectedImageView: UIImageView!
    
    // MARK: - View lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        paymentTypeLabel.text = "Label.Payment.CreditCard".localizable
    }
    
    func configure(with type: PaymentType, selected: Bool) {
        var paymentTitle = ""
        var paymentImage = UIImage()
        switch type {
        case .applePay:
            paymentTitle = "Label.Payment.ApplePay".localizable
            paymentImage = #imageLiteral(resourceName: "payment_apple_pay")
        default:
            paymentTitle = "Label.Payment.CreditCard".localizable
            paymentImage = #imageLiteral(resourceName: "payment_card")
        }
        paymentTypeLabel.text = paymentTitle
        paymentTypeImage.image = paymentImage
        selectedImageView.image = selected ? #imageLiteral(resourceName: "radio_btn_selected") : #imageLiteral(resourceName: "radio_btn_disabled")
    }
}
