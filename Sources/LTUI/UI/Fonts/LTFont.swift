//
//  LTFont.swift
//
//
//  Created by Mollo Quicaño Donnadony on 27/08/24.
//

import UIKit

public enum LTFont: String, CaseIterable {
    
    case geometriaRegular = "Geometria"
    case geometriaMedium = "Geometria-Medium"
    case geometriaBold = "Geometria-Bold"
    case montserratRegular = "Montserrat-Regular"
    case montserratSemiBold = "Montserrat-SemiBold"
    case montserratMedium = "Montserrat-Medium"
    case montserratBold = "Montserrat-Bold"
    
    static func resgiterResources() {
        for font in LTFont.allCases {
            guard
                let url = Bundle.main.url(forResource: font.rawValue, withExtension: "ttf"),
                let fontData = try? Data(contentsOf: url) as CFData,
                let provider = CGDataProvider(data: fontData),
                let font = CGFont(provider)
            else {
                fatalError("Failed to load font data")
            }
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                if let error {
                    let errorDescription = CFErrorCopyDescription(error.takeUnretainedValue()) as String
                    fatalError("Failed to load font: \(errorDescription)")
                }
            }
        }
    }
    
    public static func getFontSize(with size: CGFloat) -> CGFloat {
        var newSize:CGFloat = 0.0
        if Constants.DeviceType.IS_IPHONE_4_OR_LESS || Constants.DeviceType.IS_IPHONE_5 {
            newSize = size
        } else if Constants.DeviceType.IS_IPHONE_6P {
            newSize = size * 1.22
        } else if Constants.DeviceType.IS_IPHONE_6 {
            newSize = size * 1.08
        } else {
            newSize = size * 1.13
        }
        return newSize
    }
    
    public func withSize(_ fontSize: CGFloat) -> UIFont {
        let finalSize: CGFloat = LTFont.getFontSize(with: fontSize)
        if let font = UIFont(name: self.rawValue, size: finalSize) {
            return font;
        } else {
            #if DEBUG
            fatalError("Font \(self.rawValue) not found. Call IBKUIKit.initialize () or IBKFont.resgiterResources () functions to load IBK Fonts.")
            #else
            return UIFont.systemFont(ofSize: finalSize)
            #endif
        }
    }
    
}

