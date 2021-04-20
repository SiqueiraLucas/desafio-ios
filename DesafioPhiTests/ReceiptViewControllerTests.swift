//
//  ReceiptViewControllerTests.swift
//  DesafioPhiTests
//
//  Created by Lucas Siqueira on 16/03/21.
//

import XCTest
@testable import DesafioPhi

class ReceiptViewControllerTests: XCTestCase {
    
    // MARK: Test Loading
    
    func testLoading() {
        // Arrange
        let sut = ReceiptViewController()
            
        // Act
        _ = sut.view
            
        // Assert
        XCTAssertNotNil(sut.sharePresenter, "O objeto 'sharePresenter' não foi inicializado.")
    }
    
    // MARK: Test Share Presenter
    
    func testSharePresenter() {
        // Arrange
        let sut = ReceiptViewController()
        let sharePresenter = SharePresenterMock()
        sut.sharePresenter = sharePresenter

        // Act
        sut.share()

        // Assert
        XCTAssert(sharePresenter.presentCalled, "O método presentShare() não foi chamado.")
        XCTAssert(sharePresenter.viewController == sut, "View controller errada.")

    }
    
    // MARK: Test Hide Share Button
    
    func testHideShareButton() {
        // Arrange
        let sut = ReceiptViewController()
        _ = sut.view
        sut.prepareShare(sender: nil)

        // Act
        let value = sut.receiptView.shareButton.isHidden

        // Assert
        XCTAssertTrue(value, "O botão de compartilhar não está oculto")

    }

}
