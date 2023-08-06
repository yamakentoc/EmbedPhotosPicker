//
//  PhotosPickerModel.swift
//  EmbedPhotosPicker
//
//  Created by 山口賢登 on 2023/07/31.
//

import SwiftUI
import PhotosUI
import Observation

@Observable
class ViewModel {
    
    var loadedImages: [UIImage] = []
    
    var selectedPhotos: [PhotosPickerItem] = [] {
        didSet {
            Task {
                do {
                    var newLoadedImages: [UIImage] = []
                    for selectedPhoto in selectedPhotos {
                        if let data = try await selectedPhoto.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                newLoadedImages.append(uiImage)
                            }
                        }
                    }
                    loadedImages = newLoadedImages
                } catch {
                    print(error)
                }
            }
        }
    }
}
