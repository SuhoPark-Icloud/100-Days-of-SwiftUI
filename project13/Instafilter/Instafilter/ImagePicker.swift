//
//  ImagePicker.swift
//  Instafilter
//
//  Created by 박수호 on 2023/08/17.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    typealias UIViewControllerType = PHPickerViewController
}
