//
//  ReceiptViewModelTests.swift
//  DesafioPhiTests
//
//  Created by Lucas Siqueira on 16/03/21.
//

import XCTest
@testable import DesafioPhi

class ReceiptViewModelTests: XCTestCase {
    
    //MARK: - Instances
    
    var model = ReceiptModel()
    var sut : ReceiptViewModel?
    
    // MARK: Test Convert Amount
    
    func testConvertAmount(){
        // Arrange
        model.amount = 100
        sut = ReceiptViewModel(receipt: model)
        
        // Act
        guard let value = sut?.amount else {return}
            
        // Assert
        XCTAssertEqual(value, "$100.00", "O valor não foi convertido corretamente")
    }
    
    // MARK: Test Convert Date
    
    func testConvertDate(){
        // Arrange
        model.createdAt = "2020-11-19T03:00:00Z"
        sut = ReceiptViewModel(receipt: model)
        
        // Act
        guard let date = sut?.date else {return}
            
        // Assert
        XCTAssertEqual(date, "19/11/2020", "A data não foi convertida corretamente")
    }

}
