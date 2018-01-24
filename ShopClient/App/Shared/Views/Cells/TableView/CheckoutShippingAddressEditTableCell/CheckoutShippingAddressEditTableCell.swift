//
//  CheckoutShippingAddressEditTableCell.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 12/21/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

protocol CheckoutShippingAddressEditCellProtocol: class {
    func didTapEdit()
}

class CheckoutShippingAddressEditTableCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    weak var delegate: CheckoutShippingAddressEditCellProtocol?
    
    // MARK: - View lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        setupViews()
    }
    
    func configure(with address: Address) {
        populateViews(with: address)
    }

    func setEditButtonVisible(_ visible: Bool) {
        editButton.isHidden = !visible
    }
    
    // MARK: - Private
    
    private func setupViews() {
        editButton?.setTitle("Button.Edit".localizable.uppercased(), for: .normal)
    }
    
    private func populateViews(with address: Address) {
        nameLabel?.text = address.fullName
        addressLabel?.text = address.fullAddress
        if let phoneText = address.phone {
            let customerNameLocalized = "Label.Phone".localizable
            phoneLabel?.text = String.localizedStringWithFormat(customerNameLocalized, phoneText)
        } else {
            phoneLabel?.text = nil
        }
    }
    
    // MARK: - Actions
    
    @IBAction func editTapped(_ sender: UIButton) {
        delegate?.didTapEdit()
    }
}