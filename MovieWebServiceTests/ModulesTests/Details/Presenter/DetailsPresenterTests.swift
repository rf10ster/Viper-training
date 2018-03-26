//
//  DetailsPresenterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//


import XCTest

@testable
import MovieWebService

class DetailsPresenterTests: XCTestCase {

    var presenter: DetailsPresenter!
    var userInterface: MockDetailsView!
	
    override func setUp() {
        super.setUp()
		let router = Router(rootController: UINavigationController())
        let dataHolder = FilmServiceDataObject()
        let film = Film(data: dataHolder.data)
        userInterface = MockDetailsView()
        presenter = DetailsPresenter(router: router, film: film)
        presenter.userInterface = userInterface
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatPresenterHandlesViewReadyEvent() {
        // given
        
        // when
        presenter.triggerViewIsReady()
        
        // then
        XCTAssertTrue(userInterface.setupWithDataCalled)
    }
    
    func testThatPresenterUpdatesViewOnExpand() {
        // given
        
        // when
        presenter.expandData()
        
        // then
        XCTAssertNotNil(userInterface.data)
        XCTAssertTrue(userInterface.data?.isExpanded ?? false)
    }

}
