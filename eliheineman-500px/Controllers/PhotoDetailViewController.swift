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
        photoDetailTableView.dataSource = self
    }
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
            
            cell.configure(
                imageLink: safePhoto.image_url[0],
                title: safePhoto.name,
                name: "by \(safePhoto.user.fullname)"
            )
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoInfoTableViewCell.identifier) as! PhotoInfoTableViewCell
            
            var location = safePhoto.location ?? "No location"
            
            if location.isEmpty {
                location = "No location"
            }
            
            cell.configure(
                description: safePhoto.description,
                location: location,
                date: safePhoto.taken_at ?? "No date"
            )
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as! UserTableViewCell
            
            var city = safePhoto.user.city ?? ""
            var state = safePhoto.user.state ?? ""
            let country = safePhoto.user.country
            
            var about = safePhoto.user.about ?? ""
            
            if !city.isEmpty {
                city = "\(city) • "
            }
            
            if !state.isEmpty {
                state = "\(state) • "
            }
            
            if !about.isEmpty {
                about = "Photography hasn't written anything about themselves :("
            }
            
            cell.configure(
                imageLink: safePhoto.user.userpic_url,
                about: about,
                location: "\(city)\(state)\(country)",
                username: safePhoto.user.username
            )
            
            return cell
        }
    }
}
