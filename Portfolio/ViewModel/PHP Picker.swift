//
//  PHP Picker.swift
//  Portfolio
//
//  Created by Segun Awe on 1/13/22.
//

import Foundation
import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var showPhp: Bool
    @Binding var selectedImages: [UIImage]
   
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
      
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            print(results)
            results.forEach { im in
                 im.itemProvider.loadObject(ofClass: UIImage.self) { photo, error in
                     if let error = error {
                         print("error converting image \(error)")
                     } else {
                         self.parent.selectedImages.append(photo as! UIImage)
                     }
                }
               
            }
            parent.showPhp = false // Set isPresented to false because picking has finished.
        }
    }
}


