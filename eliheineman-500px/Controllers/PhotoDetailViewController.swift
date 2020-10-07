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
        photoDetailTableView.delegate = self
        photoDetailTableView.dataSource = self
    }

}

extension PhotoDetailViewController: UITableViewDelegate {
    
}

extension PhotoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safePhoto = photo else {fatalError("Photo was nil!")}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoDetailTableViewCell.identifier) as! PhotoDetailTableViewCell
        
        cell.configure(imageLink: safePhoto.image_url[0], title: safePhoto.name)
        
        return cell
    }
}
