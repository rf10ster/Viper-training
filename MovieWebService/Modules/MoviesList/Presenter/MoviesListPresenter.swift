//
//  MoviesListPresenter.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class MoviesListPresenter {
    weak var userInterface : MovieLislViewInterface?
    var interactor: MoviesListInteractorProtocol
    let listRouter: MoviesListRouter
    init(interactor: MoviesListInteractorProtocol, router: RouterProtocol) {
        listRouter = MoviesListRouter(router: router)
        self.interactor = interactor
    }
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    func triggerViewIsReady() {
        self.userInterface?.setupInitialState()
    }
    func fetchFilms() {
        userInterface?.showLoading()
        interactor.fetch()
    }
    func selectFilm(with index: Int) {
        guard interactor.films.count > index && index >= 0 else { return }
        let film = interactor.films[index]
        listRouter.openDetails(film: film)
    }
}

extension MoviesListPresenter: MoviesListInteractorOutput {
    func fetched(films: [Film]) {
        let data = MovieListDisplayData(films: films)
        userInterface?.show(data: data)
    }
}

