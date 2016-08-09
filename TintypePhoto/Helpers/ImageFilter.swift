//
// Created by Adrian Marszałek on 10/08/16.
// Copyright (c) 2016 Adrian Marszałek. All rights reserved.
//

import Foundation
import CoreImage

struct ImageFilter {
    internal static let sepia = CIFilter(name: "CISepiaTone")!
    internal static let grayscale = CIFilter(name: "CIPhotoEffectMono")!
    internal static let shadow = CIFilter(name: "CIHighlightShadowAdjust")!
    internal static let vignette = CIFilter(name: "CIVignette")!

    static func prepareFilters() {
        sepia.setValue(0.6, forKey: kCIInputIntensityKey)

        shadow.setValue(1.0, forKey: "inputHighlightAmount")
        shadow.setValue(-10, forKey: "inputShadowAmount")

        vignette.setValue(1.5, forKey: kCIInputIntensityKey)
        vignette.setValue(0.5, forKey: kCIInputRadiusKey)
    }
}

enum FilterType {
    case Sepia, Vignette, Grayscale, Shadow
}