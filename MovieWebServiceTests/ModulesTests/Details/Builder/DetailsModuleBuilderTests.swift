//
//  DetailsModuleBuilderTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable import MovieWebService

class DetailsModuleBuilderTests: XCTestCase {

    func testBuildViewController() {

        // given
        let data = Film()
        let builder = DetailsModuleBuilder(data: data)
        let rootController = UINavigationController()
        let router = Router(rootController: rootController)

        // when
        let viewController = builder.build(with: router)?.toPresent() as? DetailsViewController

        // then
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController?.output)
        XCTAssertTrue(viewController?.output is DetailsPresenter)

        let presenter: DetailsPresenter = viewController?.output as! DetailsPresenter
        XCTAssertNotNil(presenter.userInterface)
        XCTAssertNotNil(presenter.router)
        XCTAssertTrue(presenter.router is DetailsRouter)

    }

}
