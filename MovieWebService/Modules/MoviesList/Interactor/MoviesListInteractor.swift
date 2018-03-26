//
//  MoviesListInteractor.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class MoviesListInteractor: MoviesListInteractorProtocol {
    
    let service: FilmServiceProtocol
    weak var output: MoviesListInteractorOutput?
    
    init(service: FilmServiceProtocol) {
        self.service = service
    }
    
    // MARK: - MoviesListInteractorProtocol
    
    var films: [Film]  = [Film]()
    
    func fetch() {
        service.fetch { [weak self] fetchedFilms in
            self?.films = fetchedFilms
            self?.output?.fetched(films: fetchedFilms)
        }
    }
}
