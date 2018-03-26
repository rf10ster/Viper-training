//
//  StoryboardLoadable.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static func sbViewController<T: UIViewController>(withType type: T.Type) -> T?
}

extension StoryboardLoadable where Self: UIViewController {
    static func sbViewController<T: UIViewController>(withType type: T.Type) -> T? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: type)) as? T
    }
    static func sbViewController() -> Self? {
        return sbViewController(withType: self)
    }
}
