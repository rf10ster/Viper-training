//
//  MockMovieLislView.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class MockMovieLislView: MovieLislViewInterface {
    var setupInitialStateCalled = false
    var showLoadingCalled = false
    var showDataCalled = false
    
    func setupInitialState() {
        setupInitialStateCalled = true
    }
    func showLoading() {
        showLoadingCalled = true
    }
    func show(data: MovieListDisplayData) {
        showDataCalled = true
    }
}
