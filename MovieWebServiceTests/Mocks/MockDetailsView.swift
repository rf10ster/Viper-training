//
//  MockDetailsView.swift
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class  MockDetailsView: DetailsViewInrerface {
    
    var setupWithDataCalled = true
    
    var data: DetailsDisplayData?
    func setup(with data: DetailsDisplayData) {
        self.data = data
    }
}
