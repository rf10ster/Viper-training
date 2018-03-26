//
//  RouterProtocol.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol RouterProtocol {
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    func popToRootModule(animated: Bool)
    func setRootModule(_ module: Presentable?)
}
