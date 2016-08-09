//
// Created by Adrian Marszałek on 10/08/16.
// Copyright (c) 2016 Adrian Marszałek. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

struct OutputImage {

    internal var image: CIImage
//    private let photoDirectory: String
//    private let photoName: String

    init(sourceImage: CIImage) {
        self.image = sourceImage
    }

}

extension OutputImage {

    mutating func applyFilter(filterType: FilterType) {
        var filter: CIFilter;

        switch filterType {
        case .Sepia:
            filter = ImageFilter.sepia
        case .Grayscale:
            filter = ImageFilter.grayscale
        case .Shadow:
            filter = ImageFilter.shadow
        case .Vignette:
            filter = ImageFilter.vignette
        }
        filter.setValue(image, forKey: kCIInputImageKey)
        self.image = filter.outputImage!
    }
}