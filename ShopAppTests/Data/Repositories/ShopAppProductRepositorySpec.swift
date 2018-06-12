//
//  ShopAppProductRepositorySpec.swift
//  ShopAppTests
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Nimble
import Quick
import ShopApp_Gateway

@testable import ShopApp

class ShopAppProductRepositorySpec: QuickSpec {
    override func spec() {
        var repository: ShopAppProductRepository!
        var apiMock: APIMock!
        
        beforeEach {
            apiMock = APIMock()
            repository = ShopAppProductRepository(api: apiMock)
        }
        
        describe("when product list should be get") {
            var perPage: Int!
            var paginationValue: String!
            var sortBy: SortType!
            var keyword: String!
            var excludeKeyword: String!

            beforeEach {
                perPage = 5
                paginationValue = "pagination"
                sortBy = .name
                keyword = "key"
                excludeKeyword = "exclude"
            }
            
            context("if callback has result") {
                it("needs to handle result") {
                    apiMock.isNeedToReturnError = false
                    
                    repository.getProducts(perPage: perPage, paginationValue: paginationValue, sortBy: sortBy, keyword: keyword, excludeKeyword: excludeKeyword) { (result, error) in
                        expect(apiMock.isGetProductListStarted) == true
                        
                        expect(apiMock.perPage) == perPage
                        expect(apiMock.paginationValue) == paginationValue
                        expect(apiMock.sortBy?.rawValue) == sortBy.rawValue
                        expect(apiMock.keyword) == keyword
                        expect(apiMock.excludeKeyword) == excludeKeyword

                        expect(result).toNot(beNil())
                        expect(error).to(beNil())
                    }
                }
            }
            
            context("if callback has error") {
                it("needs to handle error") {
                    apiMock.isNeedToReturnError = true
                    
                    repository.getProducts(perPage: perPage, paginationValue: paginationValue, sortBy: sortBy, keyword: keyword, excludeKeyword: excludeKeyword) { (result, error) in
                        expect(apiMock.isGetProductListStarted) == true
                        
                        expect(apiMock.perPage) == perPage
                        expect(apiMock.paginationValue) == paginationValue
                        expect(apiMock.sortBy?.rawValue) == sortBy.rawValue
                        expect(apiMock.keyword) == keyword
                        expect(apiMock.excludeKeyword) == excludeKeyword

                        expect(result).to(beNil())
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
        
        describe("when product should be get") {
            var id: String!
            
            beforeEach {
                id = "id"
            }
            
            context("if callback has result") {
                it("needs to handle result") {
                    apiMock.isNeedToReturnError = false
                    
                    repository.getProduct(id: id) { (result, error) in
                        expect(apiMock.isGetProductStarted) == true
                        
                        expect(apiMock.id) == id
                        
                        expect(result).toNot(beNil())
                        expect(error).to(beNil())
                    }
                }
            }
            
            context("if callback has error") {
                it("needs to handle error") {
                    apiMock.isNeedToReturnError = true
                    
                    repository.getProduct(id: id) { (result, error) in
                        expect(apiMock.isGetProductStarted) == true
                        
                        expect(apiMock.id) == id
                        
                        expect(result).to(beNil())
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
        
        describe("when product should be search") {
            var perPage: Int!
            var paginationValue: String!
            var query: String!
            
            beforeEach {
                perPage = 5
                paginationValue = "pagination"
                query = "search"
            }
            
            context("if callback has result") {
                it("needs to handle result") {
                    apiMock.isNeedToReturnError = false
                    
                    repository.searchProducts(perPage: perPage, paginationValue: paginationValue, query: query) { (result, error) in
                        expect(apiMock.isSearchProductsStarted) == true
                        
                        expect(apiMock.perPage) == perPage
                        expect(apiMock.paginationValue) == paginationValue
                        expect(apiMock.query) == query
                        
                        expect(result).toNot(beNil())
                        expect(error).to(beNil())
                    }
                }
            }
            
            context("if callback has error") {
                it("needs to handle error") {
                    apiMock.isNeedToReturnError = true
                    
                    repository.searchProducts(perPage: perPage, paginationValue: paginationValue, query: query) { (result, error) in
                        expect(apiMock.isSearchProductsStarted) == true
                        
                        expect(apiMock.perPage) == perPage
                        expect(apiMock.paginationValue) == paginationValue
                        expect(apiMock.query) == query
                        
                        expect(result).to(beNil())
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
        
        describe("when product variant list should be get") {
            var ids: [String]!
            
            beforeEach {
                ids = ["id1"]
            }
            
            context("if callback has result") {
                it("needs to handle result") {
                    apiMock.isNeedToReturnError = false
                    
                    repository.getProductVariants(ids: ids) { (result, error) in
                        expect(apiMock.isGetProductVariantListStarted) == true
                        
                        expect(apiMock.ids) == ids
                        
                        expect(result).toNot(beNil())
                        expect(error).to(beNil())
                    }
                }
            }
            context("if callback has error") {
                it("needs to handle error") {
                    apiMock.isNeedToReturnError = true
                    
                    repository.getProductVariants(ids: ids) { (result, error) in
                        expect(apiMock.isGetProductVariantListStarted) == true
                        
                        expect(apiMock.ids) == ids
                        
                        expect(result).to(beNil())
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
    }
}
