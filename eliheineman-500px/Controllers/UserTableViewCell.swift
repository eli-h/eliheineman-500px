//
//  UserTableViewCell.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-07.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var displayPicture: UIImageView!

    static let identifier = "UserTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(imageLink: String, about: String, location: String, username: String) {
        displayPicture.sd_setImage(with: URL(string: imageLink), placeholderImage: UIImage(systemName: "person.circle"))
        usernameLabel.text = username
        aboutLabel.text = about
        locationLabel.text = location
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
