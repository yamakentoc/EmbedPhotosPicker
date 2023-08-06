//
//  ContentView.swift
//  EmbedPhotosPicker
//
//  Created by 山口賢登 on 2023/07/31.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
   
    @State var viewModel: ViewModel
   
    var body: some View {
        VStack {
            List(viewModel.loadedImages, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
            }
            PhotosPicker(
                selection: $viewModel.selectedPhotos, // [PhotosPickerItem]のBinding
                maxSelectionCount: 0, // 選択可能な写真の数(0で無限)
                selectionBehavior: .continuous, // defaultで順番関係なし、.orderで順番が関係するように
                matching: .images, // 写真のみ選択可能に
                preferredItemEncoding: .current, // エンコードの種類
                photoLibrary: .shared()) { // ライブラリの選択
                    Text("open PhotoLibrary")
                }
                .photosPickerStyle(.inline)
                .photosPickerDisabledCapabilities(.selectionActions)
                .photosPickerAccessoryVisibility(.hidden)
                .ignoresSafeArea()
                .frame(height: 300)
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}

