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
        guard let sut = getViewController() else { return }
            
        // Act
        _ = sut.view
            
        // Assert
        XCTAssertNotNil(sut.sharePresenter, "O objeto 'sharePresenter' não foi inicializado.")
    }
    
    // MARK: Test Share Presenter
    
    func testSharePresenter() {
        // Arrange
        guard let sut = getViewController() else { return }
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
        guard let sut = getViewController() else { return }
        _ = sut.view
        sut.prepareShare(sut)

        // Act
        let value = sut.shareButton.isHidden

        // Assert
        XCTAssertTrue(value, "O botão de compartilhar não está oculto")

    }
    
    // MARK: Get ViewController
    
    func getViewController() -> ReceiptViewController? {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExtractVC") as? ReceiptViewController else {
            XCTAssert(false, "A view controller 'ExtractVC' não foi identificada")
            return nil
        }
        return vc
    }

}
