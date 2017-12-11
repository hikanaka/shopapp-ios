//
//  Constants.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 9/5/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

let kItemsPerPage = 10

struct ControllerIdentifier {
    static let home = "HomeControllerIdentifier"
    static let productDetails = "ProductsDetailControllerIdentifier"
    static let imagesCarousel = "ImagesCarouselControllerIdentifier"
    static let menu = "MenuControllerIdentifier"
    static let search = "SearchControllerIdentifier"
    static let category = "CategoryControllerIdentifier"
    static let policy = "PolicyControllerIdentifier"
    static let lastArrivals = "LastArrivalsControllerIdentifier"
    static let articlesList = "ArticlesListControllerIdentifier"
    static let articleDetails = "ArticleDetailsControllerIdentifier"
    static let sortModal = "SortModalControllerIdentifier"
    static let productOptions = "ProductOptionsControllerIdentifier"
    static let cart = "CartControllerIdetifier"
    static let account = "AccountControllerIdentifier"
    static let auth = "AuthrntificationControllerIdentifier"
    static let checkout = "CheckoutControllerIdentifier"
    static let address = "AddressControllerIdentifier"
    static let billingAddress = "BillingAddressControllerIdentifier"
    static let signIn = "SignInControllerIdentifier"
}

struct ImageName {
    static let home = "home"
    static let sort = "sort"
    static let close = "cross"
}

struct CornerRadius {
    static let defaultValue: CGFloat = 5
}

struct Layer {
    static let shadowColor = UIColor.lightGray.cgColor
    static let shadowOpacity: Float = 0.5
    static let shadowOffset = CGSize(width: 0, height: 1)
    static let shadowRadius: CGFloat = 1
}

struct SessionData {
    static let keyPrefix = "SessionDataIdentifier"
    static let accessToken = "AccessToken"
    static let expiryDate = "ExpiryDate"
    static let email = "Email"
}

struct StatusCode {
    static let forbidden = 403
    static let unauthorized = 401
    static let notFound = 404
}

struct TableView {
    static let headerFooterMinHeight: CGFloat = 0.001
    static let headerFooterDefaultHeight: CGFloat = 20
}
