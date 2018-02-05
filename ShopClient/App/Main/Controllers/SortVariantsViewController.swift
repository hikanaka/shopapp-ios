//
//  SortVariantsViewController.swift
//  ShopClient
//
//  Created by Radyslav Krechet on 2/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

protocol SortVariantsControllerDelegate: class {
    func viewController(_ viewController: SortVariantsViewController, didSelect sortingValue: SortingValue)
}

class SortVariantsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var tableProvider: SortVariantsTableProvider!
    
    var selectedSortingValue: SortingValue!
    
    weak var delegate: SortVariantsControllerDelegate?

    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTableView()
        loadData()
    }

    // MARK: - Setup
    
    private func setupViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }

    private func setupTableView() {
        let cellName = String(describing: SortVariantTableViewCell.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
        
        tableProvider = SortVariantsTableProvider()
        tableProvider.delegate = self
        tableView.dataSource = tableProvider
        tableView.delegate = tableProvider
    }
    
    private func loadData() {
        let allValues = SortingValue.allValues
        let createdAt = allValues[SortingValue.createdAt.rawValue]
        let priceHighToLow = allValues[SortingValue.priceHighToLow.rawValue]
        let priceLowToHigh = allValues[SortingValue.priceLowToHigh.rawValue]
        tableProvider.variants = [createdAt, priceHighToLow, priceLowToHigh]
        tableProvider.selectedVariant = allValues[selectedSortingValue.rawValue]
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    func viewDidTap(gestureRecognizer: UIGestureRecognizer) {
        dismiss(animated: true)
    }
}

// MARK: - SortVariantsTableProviderDelegate

extension SortVariantsViewController: SortVariantsTableProviderDelegate {
    func provider(_ provider: SortVariantsTableProvider, didSelect variant: String?) {
        guard let delegate = delegate else {
            return
        }
        let sortingValue: SortingValue!
        if let variant = variant, let index = SortingValue.allValues.index(of: variant) {
            sortingValue = SortingValue(rawValue: index) ?? .name
        } else {
            sortingValue = .name
        }
        delegate.viewController(self, didSelect: sortingValue)
        dismiss(animated: true)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension SortVariantsViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view, view == self.view else {
            return false
        }
        return true
    }
}