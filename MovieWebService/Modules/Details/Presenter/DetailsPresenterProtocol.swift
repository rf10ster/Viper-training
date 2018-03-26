//
//  DetailsPresenterProtocol.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol DetailsPresenterProtocol {
    func triggerViewIsReady()
    func expandData()
    func close(animated: Bool)
}
