//
//  DetailsViewTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsViewTests: XCTestCase {

    var output: MockDetailsPresenter!
    var viewController: DetailsViewController!
	
    override func setUp() {
        super.setUp()

        output = MockDetailsPresenter()
		
        viewController = DetailsViewController()
        viewController.output = output
    }

    override func tearDown() {
		
        super.tearDown()
    }

    func testIfViewIsReady() {
        //given

        //when 
        viewController.viewDidLoad()

        //then
        XCTAssertTrue(output.triggerViewIsReadyCalled)
    }
}
