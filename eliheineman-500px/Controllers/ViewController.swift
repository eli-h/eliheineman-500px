//
//  ViewController.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-05.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet var photoCollectionView: UICollectionView!
    
    var apiManager = ApiManager()
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.register(PhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        apiManager.delegate = self
        apiManager.fetchPhotos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotoDetailViewController
        if let indexPath = photoCollectionView.indexPathsForSelectedItems?.first {
            let selectedPhoto = photos[indexPath.row]
            vc.photo = selectedPhoto
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        performSegue(withIdentifier: K.photoDetailIdentifier, sender: self)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if offsetY > height - scrollView.frame.size.height {
            apiManager.fetchPhotos()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        let nsfw = photos[indexPath.row].nsfw
        
        cell.configure(with: photos[indexPath.row].image_url[0], nsfw)
        
        return cell
    }
}

extension ViewController: ApiManagerDelegate {
    func didGetPhotos(_ apiManager: ApiManager, photoData: Root) {
        
        photos.append(contentsOf: photoData.photos)
        
        DispatchQueue.main.async {
            self.photoCollectionView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
