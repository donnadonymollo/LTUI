//
//  File.swift
//  
//
//  Created by Mollo Quicaño Donnadony on 27/08/24.
//

import Foundation
import UIKit

public extension NSAttributedString {
    
    convenience init(
        string: String,
        font: UIFont,
        color: UIColor? = nil,
        paragraphStyle: NSParagraphStyle? = nil,
        kern: NSNumber? = nil
    ) {
        var attributesTemp: [NSAttributedString.Key: Any] = [.font: font]
        if let color = color {
            attributesTemp[.foregroundColor] = color
        }
        if let paragraphStyle = paragraphStyle {
            attributesTemp[.paragraphStyle] = paragraphStyle
        }
        if let kern {
            attributesTemp[.kern] = kern
        }
        self.init(
            string: string,
            attributes: attributesTemp
        )
    }
    
}

public extension NSMutableAttributedString {
    
    /**
     Añade un nuevo fragmento de texto al final del objeto NSMutableAttributedString con el formato especificado.
     - Parameter string: El texto que se agregará al final del objeto NSMutableAttributedString.
     - Parameter font: La fuente que se utilizará para el texto agregado.
     - Parameter color: El color que se utilizará para el texto agregado. Si no se especifica, el color predeterminado del texto será utilizado.
     - Parameter paragraphStyle: El estilo de párrafo que se utilizará para el texto agregado. Si no se especifica, el estilo de párrafo predeterminado será utilizado.
     - Parameter kern: El espaciado entre caracteres de una cadena de texto, este valor puede ser positivo o negativo. Si no se especifica, el espaciado de la cadena de texto será predeterminado.
    */
    func append(
        string: String,
        font: UIFont,
        color: UIColor? = nil,
        paragraphStyle: NSParagraphStyle? = nil,
        kern: NSNumber? = nil
    ) {
        append(
            .init(
                string: string,
                font: font,
                color: color,
                paragraphStyle: paragraphStyle,
                kern: kern
            )
        )
    }
    
}
