//
//  BalanceViewModelTests.swift
//  BalanceViewModelTests
//
//  Created by Lucas Siqueira on 16/03/21.
//

import XCTest
@testable import DesafioPhi

class BalanceViewModelTests: XCTestCase {
    
    //MARK: - Instances
    
    var model = BalanceModel()
    var sut : BalanceViewModel?
    
    // MARK: Test Convert Balance
    
    func testConvertBalance(){
        // Arrange
        model.amount = 100
        Preferences.shared.hideBalance = false
        sut = BalanceViewModel(balance: model)
        
        // Act
        guard let value = sut?.amount else {return}
            
        // Assert
        XCTAssertEqual(value, "$100.00", "O valor não foi convertido corretamente")
    }
    
    // MARK: Test Hide Balance
    
    func testHideBalance(){
        // Arrange
        model.amount = 100
        Preferences.shared.hideBalance = true
        sut = BalanceViewModel(balance: model)
        
        // Act
        guard let value = sut?.amount else {return}
            
        // Assert
        XCTAssertEqual(value, "─────", "O valor não foi convertido corretamente")
    }
    
    // MARK: Test Modify EyeImage
    
    func testModifyEyeImage(){
        // Arrange
        let valuePersistence = Preferences.shared.hideBalance
        let nameImage = valuePersistence ? "eye.slash.fill" : "eye.fill"
        let resultImage = UIImage(systemName: nameImage)
        
        // Act
        guard let image = sut?.eyeImage else {return}
            
        // Assert
        XCTAssertEqual(image, resultImage, "A imagem é diferente do esperado")
    }

}
