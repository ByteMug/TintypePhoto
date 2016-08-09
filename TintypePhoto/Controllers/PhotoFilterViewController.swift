//
// Created by Adrian Marszałek on 05/08/16.
// Copyright (c) 2016 Adrian Marszałek. All rights reserved.
//

import UIKit
import CoreImage.CIImage

class PhotoFilterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    private let sepiaFilter = CIFilter(name: "CISepiaTone")!
    private let vignetteFilter = CIFilter(name: "CIVignette")!
    private let grayscaleFilter = CIFilter(name: "CIPhotoEffectMono")!
    private let shadowsFilter = CIFilter(name: "CIHighlightShadowAdjust")!

    private let context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blackColor()
    }

    @IBAction func addSepia(sender: AnyObject) {
        if let beginImage = CIImage(image: imageView.image!) {
            var outputImage = convertToGrayScale(beginImage)
            outputImage = addSepiaFilter(outputImage)
            outputImage = addVignette(outputImage)
            outputImage = addShadows(outputImage)

            outputImage = drawFilter(UIImage(CIImage: outputImage), imageRectangle: outputImage.extent)

            let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent)

            self.imageView.image = UIImage(CGImage: cgimg)
        }
    }

    func addSepiaFilter(targetImage: CIImage) -> CIImage {
        sepiaFilter.setValue(targetImage, forKey: kCIInputImageKey)
        sepiaFilter.setValue(0.6, forKey: kCIInputIntensityKey)

        return sepiaFilter.outputImage!

    }

    func addVignette(targetImage: CIImage) -> CIImage {
        vignetteFilter.setValue(targetImage, forKey: kCIInputImageKey)
        vignetteFilter.setValue(1.5, forKey: kCIInputIntensityKey)
        vignetteFilter.setValue(0.5, forKey: kCIInputRadiusKey)
        return vignetteFilter.outputImage!
    }


    func convertToGrayScale(image: CIImage) -> CIImage {
        grayscaleFilter.setDefaults()
        grayscaleFilter.setValue(image, forKey: kCIInputImageKey)
        return grayscaleFilter.outputImage!
    }

    func addShadows(image: CIImage) -> CIImage {
        shadowsFilter.setDefaults()
        shadowsFilter.setValue(image, forKey: kCIInputImageKey)
        shadowsFilter.setValue(1.0, forKey: "inputHighlightAmount")
        shadowsFilter.setValue(-10, forKey: "inputShadowAmount")
        return shadowsFilter.outputImage!

    }

    func drawFilter(image: UIImage, imageRectangle: CGRect) -> CIImage {
        let topImage = UIImage(named: "tintype")
        let dust = UIImage(named: "dust")
        UIGraphicsBeginImageContextWithOptions(imageRectangle.size, false, 0.0)
        let img = image
        img.drawInRect(imageRectangle)
        topImage!.drawInRect(imageRectangle, blendMode: CGBlendMode.Normal, alpha: 0.4)
        dust!.drawInRect(imageRectangle, blendMode: CGBlendMode.Normal, alpha: 0.1)

        var newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//
        UIGraphicsEndImageContext()
        return CIImage(image: newImage)!
    }
}
