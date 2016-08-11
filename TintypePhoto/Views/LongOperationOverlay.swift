import UIKit

class LongOperationOverlay {

    private static var overlay: UIView?

    internal static func show(overlayTarget: UIView) {
        let overlay = UIView(frame: overlayTarget.frame)
        overlay.center = overlayTarget.center
        overlay.alpha = 0.5
        overlay.backgroundColor = UIColor.blackColor()
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)

        let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        indicator.center = overlay.center
        indicator.startAnimating()
        overlay.addSubview(indicator)

        let label = UILabel()
        label.text = "Applying filters..."
        label.textColor = UIColor.whiteColor()
        label.sizeToFit()
        label.center = CGPoint(x: indicator.center.x, y: indicator.center.y + 30)
        overlay.addSubview(label)

        self.overlay = overlay
    }

    internal static func hide() {
        if overlay != nil {
            overlay!.removeFromSuperview()
            overlay?.removeFromSuperview()
            overlay = nil
        }
    }
}