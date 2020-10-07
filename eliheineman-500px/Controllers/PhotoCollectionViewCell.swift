//
//  PhotoCollectionViewCell.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-06.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "PhotoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with imageLink: String, _ nsfw: Bool = false) {
        //imageView.sd_setImage(with: URL(string: imageLink), placeholderImage: UIImage(systemName: "tortoise"))
        imageView.sd_setImage(with: URL(string: imageLink), placeholderImage: UIImage(systemName: "tortoise"), options: .continueInBackground) { (image, error, cache, url) in
            if nsfw {
                let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
                let blurView = UIVisualEffectView(effect: blurEffect)
                blurView.frame = self.imageView.bounds;
                self.imageView.addSubview(blurView)
            }
        }

    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
