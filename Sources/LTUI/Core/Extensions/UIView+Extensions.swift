//
//  UIView+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 27/08/24.
//

import UIKit

public extension UIView {
    
    func addBorder(
        with color: UIColor,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0,
        corners: CACornerMask? = nil
    ) {
        if let corners {
           layer.maskedCorners = corners
        }
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.cornerRadius = cornerRadius
    }
    
    func addShadow(radius: CGFloat = 8.0, opacity: Float = 1) {
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.LT_night_rider.withAlphaComponent(0.12).cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func addCustomShadowPath(
        shadowSize: CGFloat = 4,
        left: Bool = true,
        right: Bool = true,
        top: Bool = true,
        bottom: Bool = true
    ) {
        let shadowPath = UIBezierPath()
        if left {
            let leftShadowPath = UIBezierPath(
                rect: CGRect(
                    x: -shadowSize,
                    y: 0, width:
                        shadowSize,
                    height: bounds.height
                )
            )
            shadowPath.append(leftShadowPath)
        }
        if right {
            let rightShadowPath = UIBezierPath(
                rect: CGRect(
                    x: bounds.width,
                    y: 0,
                    width: shadowSize,
                    height: bounds.height
                )
            )
            shadowPath.append(rightShadowPath)
        }
        if top {
            let topShadowPath = UIBezierPath(
                rect: CGRect(
                    x: 0,
                    y: -shadowSize,
                    width: bounds.width,
                    height: shadowSize
                )
            )
            shadowPath.append(topShadowPath)
        }
        if bottom {
            let bottomShadowPath = UIBezierPath(
                rect: CGRect(
                    x: 0,
                    y: bounds.height,
                    width: bounds.width,
                    height: shadowSize
                )
            )
            shadowPath.append(bottomShadowPath)
        }
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    @discardableResult
    func withSubviews(_ views: UIView...) -> UIView {
        views.forEach { addSubview($0) }
        return self
    }
    
    func convertToImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func presentVoucherView(viewController: UIViewController) {
        let image = self.convertToImage()
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.excludedActivityTypes = [.assignToContact, .addToReadingList, .openInIBooks]
        viewController.present(activityVC, animated: true, completion: nil)
    }
    
    func temporarilyDisableInteraction(for time: Double = 0.5) {
        isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + time) { [weak self] in
            self?.isUserInteractionEnabled = true
        }
    }
    
    func sizeForTableHeaderFooterView(view: UIView) -> CGSize {
        let desiredSize = CGSize(width: view.frame.size.width, height: 0)
        let headerSize = view.systemLayoutSizeFitting(
            desiredSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return headerSize
    }
    
}

