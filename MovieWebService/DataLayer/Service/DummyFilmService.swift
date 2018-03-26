//
//  DummyFimService.swift
//  MovieWebService
//
//  Created by Aleksey Kiselev on 11/14/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

@objc class DummyFilmService: NSObject, FilmServiceProtocol {
    
    let dataObject = FilmServiceDataObject()
    
    func fetch(completion: @escaping (_ films: [Film]) -> Void) {
        let film = Film(data: dataObject.data)
        DispatchQueue.main.async {
            completion([film])
        }
    }
}
