//
//  Array+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public extension Array {
    
    /**
       Propiedad computada que devuelve un valor booleano que indica si el arreglo no está vacío, es decir, si tiene al menos un item.
    */
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    /**
     Divide una lista en subgrupos más pequeños de un tamaño específico.
     - Parameters:
        - groupSize: El tamaño deseado de cada subgrupo.
     - Returns: Una matriz bidimensional que contiene los subgrupos divididos.
     */
    func divideList(groupSize: Int) -> [[Element]] {
        var dividedList: [[Element]] = []
        for item in stride(from: 0, to: self.count, by: groupSize) {
            dividedList.append(Array(self[item..<Swift.min(item+groupSize, self.count)]))
        }
        return dividedList
    }
    
    /**
     Accede a un elemento del array de manera segura, devolviendo `nil` si el índice proporcionado está fuera de rango.
     - Parameters:
        -  index: El índice del elemento al que se quiere acceder.
     - Returns: El elemento en el índice especificado, si el índice es válido; de lo contrario retornará `nil`.
     - Example:
        ```
        let array = [1, 2, 3]
        print(array[safe: 1])  // Prints "Optional(2)"
        print(array[safe: 5])  // Prints "nil"
        ```
    */
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}
