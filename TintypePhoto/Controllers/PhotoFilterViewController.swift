//
// Created by Adrian Marszałek on 05/08/16.
// Copyright (c) 2016 Adrian Marszałek. All rights reserved.
//

import UIKit
import CoreImage.CIImage

class PhotoFilterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    private let imageContext = CIContext(options: nil)

    //
    private let topImage = UIImage(named: "tintype3")
    private let dust = UIImage(named: "dust")

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageFilter.prepareFilters()
    }

    @IBAction func manipulateImage(sender: AnyObject) {
        if let beginImage = CIImage(image: imageView.image!) {
            var outputImage = OutputImage(sourceImage: beginImage)

            outputImage.applyFilter(FilterType.Grayscale)
            outputImage.applyFilter(FilterType.Sepia)
            outputImage.applyFilter(FilterType.Vignette)
            outputImage.applyFilter(FilterType.Shadow)

           var outputImage2 = drawFilter(UIImage(CIImage: outputImage.image), imageRectangle: outputImage.image.extent)


            let cgimg = imageContext.createCGImage(outputImage2, fromRect: outputImage2.extent)

            self.imageView.image = UIImage(CGImage: cgimg)
        }
    }

    func drawFilter(image: UIImage, imageRectangle: CGRect) -> CIImage {
        UIGraphicsBeginImageContextWithOptions(imageRectangle.size, false, 0.0)
        image.drawInRect(imageRectangle)
        topImage!.drawInRect(imageRectangle, blendMode: CGBlendMode.Normal, alpha: 0.4)
        dust!.drawInRect(imageRectangle, blendMode: CGBlendMode.Normal, alpha: 0.1)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return CIImage(image: newImage)!
    }
}
