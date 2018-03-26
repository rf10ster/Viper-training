//
//  File.swift
//  MovieWebService
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol MoviesListRouterProtocol {
    func openDetails(film: Film)
}

struct MoviesListRouter: MoviesListRouterProtocol {
    
    let router: RouterProtocol
    
    func openDetails(film: Film) {
        let detailsBuilder = DetailsModuleBuilder(data: film)
        let detailsModule = detailsBuilder.build(with: router)
        router.push(detailsModule, animated: true, completion: nil)
    }
}
