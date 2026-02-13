//
//  UserDefaultsWrapper..swift
//  LTUI
//
//  Created by Donnadony Mollo Quicaño on 27/11/24.
//

import Foundation

// MARK: - OptionalProtocol

/// Protocolo para detectar valores nil en tipos genericos
protocol OptionalProtocol {
    
    var isNil: Bool { get }
    
}

extension Optional: OptionalProtocol {
   
    var isNil: Bool {
        return self == nil
    }
    
}

/**
 PropertyWrapper para simplificar la interacción con UserDefaults al almacenar y recuperar valores de diferentes tipos.
 */
@propertyWrapper
public struct UserDefaultsWrapper<Value> {
    
    // MARK: - Properties
    
    let key: String
    let usePrefix: Bool
    let defaultValue: Value
    
    // MARK: - Computed properties
    
    private var finalKey: String {
        if usePrefix {
            return "\(UserDefaultsManager.prefix)-\(key)"
        } else {
            return key
        }
    }
    
    /// El valor almacenado en UserDefaults para la clave especificada.
    public var wrappedValue: Value {
        get {
            if Value.self == URL?.self {
                return UserDefaultsManager.defaults.url(forKey: finalKey) as? Value ?? defaultValue
            } else {
                return UserDefaultsManager.defaults.object(forKey: finalKey) as? Value ?? defaultValue }
        }
        set {
            // Si el valor es nil, eliminar la clave de UserDefaults
            if let optional = newValue as? OptionalProtocol, optional.isNil {
                UserDefaultsManager.defaults.removeObject(forKey: finalKey)
            } else if let url = newValue as? URL {
                UserDefaultsManager.defaults.set(url, forKey: finalKey)
            } else {
                UserDefaultsManager.defaults.set(newValue, forKey: finalKey)
            }
        }
    }
    
    // MARK: - Lifecycle
    
    /**
     Inicializa una nueva instancia de `UserDefaultsWrapper`.
     - Parameters:
     - key: La clave única utilizada para almacenar y recuperar el valor en UserDefaults.
     - usePrefix: Un indicador de si se debe usar un prefijo en la clave al almacenar en UserDefaults.
     - defaultValue: El valor predeterminado utilizado cuando no se encuentra ningún valor almacenado en UserDefaults.
     */
    public init(key: String, usePrefix: Bool = false, defaultValue: Value) {
        self.key = key
        self.usePrefix = usePrefix
        self.defaultValue = defaultValue
    }
    
}

// MARK: - UserDefaultsWrapper Value as String

public extension UserDefaultsWrapper where Value == String {
    
    /**
     Inicializa una nueva instancia de `UserDefaultsWrapper` con el tipo de valor String.
     - Parameters:
     - key: La clave única utilizada para almacenar y recuperar el valor en UserDefaults.
     - usePrefix: Un indicador de si se debe usar un prefijo en la clave al almacenar en UserDefaults.
     - defaultValue: El valor predeterminado utilizado cuando no se encuentra ningún valor almacenado en UserDefaults.
     */
    init(key: String, usePrefix: Bool = false, defaultValue: String = "") {
        self.key = key
        self.usePrefix = usePrefix
        self.defaultValue = defaultValue
    }
    
}

// MARK: - UserDefaultsWrapper Value as Bool

public extension UserDefaultsWrapper where Value == Bool {
    
    /**
     Inicializa una nueva instancia de `UserDefaultsWrapper` con el tipo de valor Bool.
     - Parameters:
     - key: La clave única utilizada para almacenar y recuperar el valor en UserDefaults.
     - usePrefix: Un indicador de si se debe usar un prefijo en la clave al almacenar en UserDefaults.
     - defaultValue: El valor predeterminado utilizado cuando no se encuentra ningún valor almacenado en UserDefaults.
     */
    init(key: String, usePrefix: Bool = false, defaultValue: Bool = false) {
        self.key = key
        self.usePrefix = usePrefix
        self.defaultValue = defaultValue
    }
    
}
