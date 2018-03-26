//
//  MockMoviesListInteractor
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class MockMoviesListInteractor: MoviesListInteractorProtocol {
    
    var fetchCalled = false
    
    var films = [Film]()
    func fetch() {
        fetchCalled = true
    }
}
