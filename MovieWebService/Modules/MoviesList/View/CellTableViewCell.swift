//
//  CellTableViewCell.swift
//  MovieWebService
//
//  Created by Алексей Киселев on 15/11/2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var ratingName: UILabel!
    
    func configure(dataItem: Film) {
        let cell = self
        
        cell.name.text = dataItem.name
        
        // Oct 12, 2012
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        cell.date.text = formatter.string(from: dataItem.releaseDate)
        cell.rating.text = String(describing: dataItem.rating)
        let ratingName: String
        switch dataItem.filmRating {
        case G:
            ratingName = "G"
        case PG:
            ratingName = "PG"
        case PG13:
            ratingName = "PG13"
        case R:
            ratingName = "R"
        case NC17:
            ratingName = "NC17"
        default:
            ratingName = "G"
        }
        cell.ratingName.text = ratingName
    }

}
