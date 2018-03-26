//
//  MoviesListModuleBuilderTests.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest
@testable import MovieWebService

class MoviesListModuleBuilderTests: XCTestCase {
    
    func testBuildViewController() {
        
        // given
        let builder = MoviesListModuleBuilder()
        let rootController = UINavigationController()
        let router = Router(rootController: rootController)
        
        // when
        let viewController = builder.build(with: router)?.toPresent() as? MoviesListViewController
        
        // then
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController?.output)
        XCTAssertTrue(viewController?.output is MoviesListPresenter)
        
        let presenter: MoviesListPresenter = viewController?.output as! MoviesListPresenter
        XCTAssertNotNil(presenter.userInterface)
        XCTAssertNotNil(presenter.listRouter)
        XCTAssertTrue(presenter.listRouter is MoviesListRouter)
        
        let interactor: MoviesListInteractor = presenter.interactor as! MoviesListInteractor
        XCTAssertNotNil(interactor.output)
        
    }
    
}
