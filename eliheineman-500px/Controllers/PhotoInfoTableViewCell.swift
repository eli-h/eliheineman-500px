//
//  PhotoInfoTableViewCell.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-07.
//

import UIKit

class PhotoInfoTableViewCell: UITableViewCell {
    static let identifier = "PhotoInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
