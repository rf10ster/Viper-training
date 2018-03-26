//
//  FilmServiceProtocol.swift
//  MovieWebService
//
//  Created by Aleksey Kiselev on 11/14/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol FilmServiceProtocol {
    func fetch(completion: @escaping (_ films: [Film]) -> Void)
}
