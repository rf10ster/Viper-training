//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, TappableLabelDelegate, StoryboardLoadable {

    var output: DetailsPresenterProtocol!

    @IBOutlet var directorName: UILabel!
    @IBOutlet var tapToShowMore: TappableLabel!
    @IBOutlet var actorName: UILabel!
    @IBOutlet var actorScreenName: UILabel!
    @IBOutlet var expandableView: UIView!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.triggerViewIsReady()
    }


    // MARK: DetailsViewInput

    func didReceiveTouch() {
        output.expandData()
    }

}

extension DetailsViewController: DetailsViewInrerface {
    
    func setup(with data: DetailsDisplayData) {
        directorName.text = data.directorName
        actorName.text = data.actorName
        actorScreenName.text = data.actorScreenName
        
        expandableView.isHidden = !data.isExpanded
    }
}
