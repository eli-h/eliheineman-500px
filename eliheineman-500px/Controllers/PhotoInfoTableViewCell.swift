//
//  PhotoInfoTableViewCell.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-07.
//

import UIKit

class PhotoInfoTableViewCell: UITableViewCell {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var locationAndDateLabel: UILabel!
    
    static let identifier = "PhotoInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func formatDate(_ date: String) -> String {
        var newDate = date
        if let tRange = newDate.range(of: "T") {
            newDate.removeSubrange(tRange.lowerBound..<newDate.endIndex)
        }
        
        return newDate
    }
    
    public func configure(description: String, location: String, date: String) {
        descriptionLabel.text = description
        var formattedDate = date
        
        if date != "No Date" {
            formattedDate = formatDate(date)
        }
        
        locationAndDateLabel.text = "\(location) • \(formattedDate)"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
