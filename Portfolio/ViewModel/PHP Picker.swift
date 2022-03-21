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
    @Binding var imgNum: Int16
   
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
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
////            print(results)
//            results.forEach { im in
//                 im.itemProvider.loadObject(ofClass: UIImage.self) { photo, error in
//                     if let error = error {
//                         print("error converting image \(error)")
//                     } else {
//                         self.parent.selectedImages.append(photo as! UIImage)
//                     }
//                }
//
//            }
//            parent.showPhp = false // Set isPresented to false because picking has finished.
//        }
        func picker(_: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for image in results {
                image.itemProvider.loadObject(ofClass: UIImage.self) { selectedImage, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    guard let uiImage = selectedImage as? UIImage else {
                        print("unable to unwrap image as UIImage")
                        return
                    }
                    
                    
                    self.parent.selectedImages.append(uiImage)
                    self.parent.imgNum += 1
                    
                }
            }
            
            parent.showPhp = false // Set isPresented to false because picking has finished.
            
        }
        
    }
    
}
