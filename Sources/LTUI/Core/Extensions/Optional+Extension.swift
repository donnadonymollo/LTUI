//
//  Optional+Extension.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension Optional where Wrapped == String {
    
    /**
       Funcion que retorna una cadena no opcional a partir de un `String?`
     - Si el valor original es `nil`, devuelve una cadena vacía.
     - Si el valor original no es `nil`, devuelve el valor desempaquetado.
    */
    func orEmpty() -> String {
        self ?? ""
    }
    
}
