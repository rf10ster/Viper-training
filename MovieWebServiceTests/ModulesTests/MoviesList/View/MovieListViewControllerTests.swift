//
//  MovieListViewControllerTests.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest
@testable import MovieWebService

class MovieListViewControllerTests: XCTestCase {
    
    var controller: MoviesListViewController!
    var output: MockMoviesListPresenter!
    
    override func setUp() {
        super.setUp()
        controller = MoviesListViewController()
        output = MockMoviesListPresenter()
        controller.output = output
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testThatControllerNotifiesPresenterOnDidLoad() {
        // given
        
        // when
        controller.viewDidLoad()
        
        // then
        XCTAssertTrue(output.triggerViewIsReadyCalled, "Controller should notify presenter")
    }
    
    func testThatControllerAskPresenterToFetchDataOnDidAppear() {
        // given
        
        // when
        controller.viewDidAppear(true)
        
        // then
        XCTAssertTrue(output.fetchFilmsCalled, "Controller should ask presenter to fetch")
    }
    
    func testThatControllerPassRowIndexOnTableRowSelect() {
        // given
        let testTable = UITableView()
        let indexPath = IndexPath(row: 5, section: 3)

        // when
        controller.tableView(testTable, didSelectRowAt: IndexPath(row: 5, section: 3))
        
        // then
        XCTAssertTrue(output.selectFilmCalledIndex ==  indexPath.row, "Controller should pass row number")
    }

}

