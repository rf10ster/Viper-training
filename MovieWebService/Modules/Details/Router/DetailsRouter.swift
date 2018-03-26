//
//  DetailsRouter.swift
//  MovieWebService
//
//  Created by Aleksey Kiselev on 11/16/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol DetailsRouterProtocol {
    func closeDetails()
}

struct DetailsRouter: DetailsRouterProtocol {
    
    let router: RouterProtocol
    
    func closeDetails() {
        router.popModule(animated: true)
    }
}
