//
//  EmbedPhotosPickerApp.swift
//  EmbedPhotosPicker
//
//  Created by 山口賢登 on 2023/07/31.
//

import SwiftUI

@main
struct EmbedPhotosPickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
