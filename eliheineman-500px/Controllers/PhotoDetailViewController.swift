//
//  PhotoDetailViewController.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-06.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet var photoDetailTableView: UITableView!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoDetailTableView.register(PhotoDetailTableViewCell.nib(), forCellReuseIdentifier: PhotoDetailTableViewCell.identifier)
        photoDetailTableView.register(PhotoInfoTableViewCell.nib(), forCellReuseIdentifier: PhotoInfoTableViewCell.identifier)
        photoDetailTableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        photoDetailTableView.delegate = self
        photoDetailTableView.dataSource = self
    }

}

extension PhotoDetailViewController: UITableViewDelegate {
    
}

extension PhotoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safePhoto = photo else {fatalError("Photo was nil!")}
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoDetailTableViewCell.identifier) as! PhotoDetailTableViewCell
            cell.configure(imageLink: safePhoto.image_url[0], title: safePhoto.name)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoInfoTableViewCell.identifier) as! PhotoInfoTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as! UserTableViewCell
            return cell
        }
    }
}
