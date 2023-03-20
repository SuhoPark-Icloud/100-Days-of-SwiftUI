//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by 박수호 on 2023/03/19.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        // scale: 을 활용하여 고해상도 이미지를 적당히 축소시킬 수 있다.
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
        // placeholder를 사용해서 이미지가 불러오기 전의 그림을 사전 지정할 수 있다.
        // 또한 closure를 사용하여 AsyncImage를 Image 형태처럼 조정할 수 있다.
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
