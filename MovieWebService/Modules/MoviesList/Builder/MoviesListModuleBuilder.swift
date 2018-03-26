//
//  MoviesListModuleBuilder.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

struct MoviesListModuleBuilder: ModuleBuilder {
    func build(with router: RouterProtocol) -> Presentable? {
        
        let service = DummyFilmService()
        let interactor = MoviesListInteractor(service: service)
        
        let list = MoviesListViewController.sbViewController()
        let presenter = MoviesListPresenter(interactor: interactor, router: router)
        presenter.userInterface = list
        list?.output = presenter
        
        return list?.toPresent()
    }
}
