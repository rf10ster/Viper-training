//
//  MoviesListInteractorTests.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class MoviesListInteractorTests: XCTestCase {
    
    var output: MockMoviesListPresenter!
    var interactor: MoviesListInteractor!
    
    
    override func setUp() {
        super.setUp()
        output = MockMoviesListPresenter()
        interactor = MoviesListInteractor(service: DummyFilmService())
        interactor.output = output
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatOutputReceivesDataOnCallback() {
        // given
        let promise = expectation(description: "Executed")
        // when
        interactor.fetch()
        // wait for our callback
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            promise.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
        // then
        XCTAssertTrue(!output.films.isEmpty)
    }
}
