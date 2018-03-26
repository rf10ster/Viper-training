//
//  MoviesListPresenterTests.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest
@testable import MovieWebService

class MoviesListPresenterTests: XCTestCase {
    
    var presenter: MoviesListPresenter!
    var interactor: MockMoviesListInteractor!
    var userInterface: MockMovieLislView!
    
    override func setUp() {
        super.setUp()
        let router = Router(rootController: UINavigationController())
        interactor = MockMoviesListInteractor()
        presenter = MoviesListPresenter(interactor: interactor, router: router)
        userInterface = MockMovieLislView()
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
        XCTAssertTrue(userInterface.setupInitialStateCalled)
    }
    
    func testThatPresenterTellViewFetchState() {
        // given
        
        // when
        presenter.fetchFilms()
        
        // then
        XCTAssertTrue(userInterface.showLoadingCalled)
    }
    
    func testThatPresenterTellViewFetchedState() {
        // given
        let films = [Film]()
        // when
        presenter.fetched(films: films)
        
        // then
        XCTAssertTrue(userInterface.showDataCalled)
    }
}




