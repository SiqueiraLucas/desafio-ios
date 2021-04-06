//
//  APIRequestTests.swift
//  APIRequestTests
//
//  Created by Lucas Siqueira on 15/03/21.
//

import XCTest
@testable import DesafioPhi

class APIRequestTests: XCTestCase {
    
    // MARK: Instances
    
    var sut : ViewModelProtocol?
    
    // MARK: Test Request Balance
    
    func testRequestBalance(){
        // Arrange
        sut = BalanceViewModel(balance: BalanceModel())
        
        // Act
        sut?.getContentData()
        
        // Assert
        let expect = expectation(description: "Test depois de 5 segundos")
        let result = XCTWaiter.wait(for: [expect], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertEqual(sut?.requestResult, "Sucess")
        }else{
            XCTFail("Delay interrompido")
        }
    }
    
    // MARK: Test Request Extract
    
    func testRequestExtract(){
        // Arrange
        sut = ExtractViewModel(extracts: [Item]())
        
        // Act
        sut?.getContentData()
        
        // Assert
        let expect = expectation(description: "Test depois de 5 segundos")
        let result = XCTWaiter.wait(for: [expect], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertEqual(sut?.requestResult, "Sucess")
        }else{
            XCTFail("Delay interrompido")
        }
    }
    
    // MARK: Test Request Receipt
    
    func testRequestReceipt(){
        // Arrange
        sut = ReceiptViewModel(receipt: ReceiptModel())
        guard let sut = sut as? ReceiptViewModel else {return}
        sut.id = "49E27207-F3A7-4264-B021-0188690F7D43"
        
        // Act
        sut.getContentData()
        
        // Assert
        let expect = expectation(description: "Test depois de 5 segundos")
        let result = XCTWaiter.wait(for: [expect], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertEqual(sut.requestResult, "Sucess")
        }else{
            XCTFail("Delay interrompido")
        }
    }

}
