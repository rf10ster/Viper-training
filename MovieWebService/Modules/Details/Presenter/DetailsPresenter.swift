//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsPresenter {

    weak var userInterface : DetailsViewInrerface?
    let router: RouterProtocol
    
    private var data: DetailsDisplayData
    
    init(router: RouterProtocol, film: Film) {
        self.router = router
        let firstActor = film.cast.first
        data = DetailsDisplayData(
            directorName: film.director.name,
            actorName: firstActor?.name,
            actorScreenName: firstActor?.screenName,
            isExpanded: false
        )
    }

}

extension DetailsPresenter: DetailsPresenterProtocol {
    func triggerViewIsReady() {
        userInterface?.setup(with: data)
    }
    func expandData() {
        data.isExpanded = true
        userInterface?.setup(with: data)
    }
    func close(animated: Bool) {
        router.popModule(animated: animated)
    }
}
