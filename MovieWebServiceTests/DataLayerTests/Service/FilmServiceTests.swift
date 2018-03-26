//
//  FilmServiceTests.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/14/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest
@testable import MovieWebService

class FilmServiceTests: XCTestCase {
    
    let mockService = DummyFilmService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testServiceCallCompletionInMainThreadWithSignleFilmInResults() {
        // given
        let promise = expectation(description: "Executed")
        var filmsCount = 0
        var calledImMain = false
        
        // when
        mockService.fetch { films in
            filmsCount = films.count
            calledImMain = Thread.isMainThread
            promise.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        
        // then
        XCTAssertTrue(filmsCount == 1, "Dummy service should return single film")
        XCTAssertTrue(calledImMain, "Service should call completion on main thread")
    }
}
