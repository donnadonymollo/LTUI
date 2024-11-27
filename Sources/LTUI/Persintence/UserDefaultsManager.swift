//
//  UserDefaultsManager.swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

import Foundation

open class UserDefaultsManager {
    
    // MARK: - Properties
    
    public static var defaults = UserDefaults.standard
    public static var prefix = ""
    
    // MARK: - Functions
    
    /**
     Elimina todos los valores de UserDefaults, excepto aquellas especificadas en `keysToPreserve`.
     - Parameters:
        - keysToPreserve: Un arreglo de `Strings` que contiene las keys de UserDefaults que no deben eliminarse.
    */
    public static func removeAllUserDefaults(except keysToPreserve: [String]) {
        let allKeys = defaults.dictionaryRepresentation().keys
        for key in allKeys {
            if !keysToPreserve.contains(key) {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    /**
     Verifica si hay alguna clave en UserDefaults que contenga el texto proporcionado.
     - Parameters:
        - containing: Una cadena de texto `String` que será usada para buscar entre las claves de UserDefaults.
     - Returns:
        Devuelve `true` si existe al menos una clave que contenga el texto proporcionado; de lo contrario, devuelve `false`.
    */
    public static func containsKey(containing text: String) -> Bool {
        defaults.dictionaryRepresentation().keys.contains { $0.contains(text) }
    }
    
}
