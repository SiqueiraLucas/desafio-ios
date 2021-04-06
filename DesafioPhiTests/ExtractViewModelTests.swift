//
//  ExtractViewModelTests.swift
//  DesafioPhiTests
//
//  Created by Lucas Siqueira on 16/03/21.
//

import XCTest
@testable import DesafioPhi

class ExtractViewModelTests: XCTestCase {
    
    //MARK: - Instances
    
    var model = [Item]()
    var item = Item()
    var sut : ExtractViewModel?
    
    // MARK: Test Convert Amount
    
    func testConvertAmount(){
        // Arrange
        item.amount = 100
        model.append(item)
        sut = ExtractViewModel(extracts: model)
        
        // Act
        guard let value = sut?.returnAmount(index: model.count-1) else {return}
            
        // Assert
        XCTAssertEqual(value, "$100.00", "O valor não foi convertido corretamente")
    }
    
    // MARK: Test Verify PIX
    
    func testVerifyPIX(){
        // Arrange
        item.tType = "PIXCASHIN"
        model.append(item)
        sut = ExtractViewModel(extracts: model)
        
        // Act
        guard let isPix = sut?.returnPix(index: model.count-1) else {return}
            
        // Assert
        XCTAssertTrue(isPix, "A transação não é do tipo PIX")
    }
    
    // MARK: Test Convert Date
    
    func testConvertDate(){
        // Arrange
        item.createdAt = "2020-11-19T03:00:00Z"
        model.append(item)
        sut = ExtractViewModel(extracts: model)
        
        // Act
        guard let date = sut?.returnDate(index: model.count-1) else {return}
            
        // Assert
        XCTAssertEqual(date, "19/11", "A data não foi convertida corretamente")
    }

}
