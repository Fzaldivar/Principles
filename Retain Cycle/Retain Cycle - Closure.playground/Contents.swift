import Foundation
import UIKit

typealias DidGetPhotos = (_ photos: Array<Any>) -> Void

final class PhotosViewModel {
    var didGetPhotos: DidGetPhotos?
    
    func getPhotos() {
        let photos = [Any]()
        
        if didGetPhotos != nil {
            didGetPhotos!(photos)
        }
    }
}


final class PhotosViewController: UIViewController {
    
    let photosViewModel = PhotosViewModel()
    
    // [weak self] => capture list
    func loadPhotos() {
        photosViewModel.didGetPhotos = { [weak self] photos in
            guard let self = self else { return }
            self.updatePhotosInView()
        }
    }
    
    deinit {
        print("Deinit View Controller")
    }
    
    func updatePhotosInView() {
        // Logic to update photos
    }
}

var vc: PhotosViewController? = PhotosViewController()
vc?.loadPhotos()
vc = nil
