//
//  MockDetailsPresenter.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class MockDetailsPresenter: DetailsPresenterProtocol {
    
    var triggerViewIsReadyCalled = false
    var expandDataCalled = false
    var closeCalled = false
    
    func triggerViewIsReady() {
        triggerViewIsReadyCalled = true
    }
    
    func expandData() {
        expandDataCalled = true
    }
    
    func close(animated: Bool) {
        closeCalled = true
    }
}

