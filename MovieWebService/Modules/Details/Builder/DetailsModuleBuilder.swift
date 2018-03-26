//
//  DetailsModuleBuilder.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

struct DetailsModuleBuilder: ModuleBuilder {
    let data: Film
    func build(with router: RouterProtocol) -> Presentable? {
        
        let view = DetailsViewController.sbViewController()
        let presenter = DetailsPresenter(router: router, film: data)
        view?.output = presenter
        presenter.userInterface = view
        
        return view?.toPresent()
    }
}

