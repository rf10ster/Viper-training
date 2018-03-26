//
//  MockMoviesListPresenter
//  MovieWebServiceTests
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation
import XCTest
@testable import MovieWebService

class MockMoviesListPresenter: MoviesListPresenterProtocol {
    var triggerViewIsReadyCalled = false
    var fetchFilmsCalled = false
    var selectFilmCalled = false
    var selectFilmCalledIndex = NSNotFound
    
    func triggerViewIsReady() {
        triggerViewIsReadyCalled = true
    }
    func fetchFilms() {
        fetchFilmsCalled = true
    }
    func selectFilm(with index: Int) {
        selectFilmCalled = true
        selectFilmCalledIndex = index
    }
    
    // MARK:- MoviesListInteractorOutput helper
    var films =  [Film]()
}

extension MockMoviesListPresenter: MoviesListInteractorOutput {
    func fetched(films: [Film]) {
        self.films = films
    }
}
