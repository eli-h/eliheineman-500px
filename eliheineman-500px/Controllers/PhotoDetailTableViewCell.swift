//
//  PhotoDetailTableViewCell.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-06.
//

import UIKit

class PhotoDetailTableViewCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    static let identifier = "PhotoDetailTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(imageLink: String, title: String, name: String) {
        photoImageView.sd_setImage(with: URL(string: imageLink), placeholderImage: UIImage(systemName: "tortoise"))
        titleLabel.text = title
        nameLabel.text = name
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
