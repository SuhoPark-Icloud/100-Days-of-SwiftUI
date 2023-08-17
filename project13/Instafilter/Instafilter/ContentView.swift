//
//  ContentView.swift
//  Instafilter
//
//  Created by 박수호 on 2023/06/06.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)

        // Sepia tone
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1

        // pixellation filter
        let currentFilter2 = CIFilter.pixellate()
        currentFilter2.inputImage = beginImage
        currentFilter2.scale = 100

        // crystal effect
        let currentFilter3 = CIFilter.crystallize()
        currentFilter3.inputImage = beginImage
        currentFilter3.radius = 30

        // twirl distortion filter
        let currentFilter4 = CIFilter.twirlDistortion()
        currentFilter4.inputImage = beginImage
        currentFilter4.radius = 1000
        currentFilter4.center = CGPoint(
            x: inputImage.size.width / 2,
            y: inputImage.size.height / 2)

        // 사용하는 filter가 어떤 것인지 무관하게 amount를 조절할 수 있도록 if문 분기
        let amount = 1.0
        let inputKeys = currentFilter4.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter4.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter4.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter4.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter4.outputImage else { return }

        let context = CIContext()
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)

            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
