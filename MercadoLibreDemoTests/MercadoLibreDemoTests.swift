//
//  MercadoLibreDemoTests.swift
//  MercadoLibreDemoTests
//
//  Created by Alan Valencia on 10/12/21.
//

import XCTest
@testable import MercadoLibreDemo

class MercadoLibreDemoTests: XCTestCase {
    
    private let manager = ProductApiManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetShows() {
        
        let expectation = self.expectation(description: "Products obtained successfully")
        defer { waitForExpectations(timeout: 2) }
        
        manager.getProducts(searchQuery: "Iphone 13") { (response) in
            expectation.fulfill()
            switch response {
            case .success(let productResponse):
                XCTAssertNotNil(productResponse)
            case .error(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    func testGetShowDetail() {
        
        let id = "MLM888316967"
        let expectation = self.expectation(description: "Product detail id \(id) obtained successfully")
        defer { waitForExpectations(timeout: 2) }
        
        manager.getProductDetail(id: id) { (response) in
            expectation.fulfill()
            switch response {
            case .success(let productDetail):
                XCTAssertNotNil(productDetail)
            case .error(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
}
