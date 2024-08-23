//
//  String+Extensions.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation
import UIKit

public extension String {
    
    /**
     Verifica si una cadena de caracteres solo contiene dígitos numéricos.
     - Returns: true si la cadena de caracteres solo contiene dígitos numéricos, false en caso contrario.
    */
    var isOnlyNumber: Bool {
        var result = false
        let regEx = "^[0-9]*$"
        let matchPattern = NSPredicate(format: "SELF MATCHES %@", regEx)
        result = matchPattern.evaluate(with: self)
        return result
    }
    
    /**
     Determina si una cadena de texto contiene emojis.
     - Returns: `true` si la cadena de texto contiene emojis, `false` en caso contrario.
     */
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
                0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                0x1F680...0x1F6FF, // Transport and Map
                0x2600...0x26FF,   // Misc symbols
                0x2700...0x27BF,   // Dingbats
                0xFE00...0xFE0F,   // Variation Selectors
                0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
                0x1F1E6...0x1F1FF: // Flags
                return true
            default:
                continue
            }
        }
        return false
    }
    
    /**
       Propiedad computada que devuelve un valor booleano que indica si la cadena no está vacía, es decir, si tiene al menos un carácter.
    */
    var isNotEmpty: Bool { !isEmpty }
    
    /**
     Expresion regular para validar si el String solo contiene caracteres numéricos.
     - Returns: TRUE si el String solo contiene caracteres numéricos FALSE si el String contiene caracteres alfabeticos.
     */
    var isNumeric: Bool {
        range(of: "^[0-9]+$", options: .regularExpression) != nil
    }
    
    /**
     Expresion regular para validar si el String solo contiene caracteres alfabeticos.
     - Returns: TRUE si el String solo contiene caracteres alfabeticos FALSE si el String contiene caracteres numéricos.
     */
    var isAlphabetic: Bool {
        range(of: "^[a-zA-Z ]+$", options: .regularExpression) != nil
    }
    
    /**
     Esta función devuelve una nueva cadena que contiene solo caracteres válidos para un correo electrónico. Los caracteres válidos incluyen letras (tanto minúsculas como mayúsculas), números, el símbolo @, el punto y el guión bajo. Todos los demás caracteres se eliminan de la cadena resultante.
     - Returns: Una nueva cadena que contiene solo caracteres válidos para un correo electrónico.
    */
    var filterEmailCharacters: String {
        let validCharacters = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890@._-")
        return self.filter { validCharacters.contains($0) }
    }
    
    /**
     Verifica si una cadena de texto contiene únicamente letras y espacios en blanco.
     - Returns: `true` si la cadena de texto contiene únicamente letras y espacios en blanco, de lo contrario, devuelve `false`.
     */
    var isLettersAndWhiteSpaces: Bool {
        let finalCharactersSet = CharacterSet.letters.union(CharacterSet.whitespaces)
        let characterSet = CharacterSet(charactersIn: self)
        return finalCharactersSet.isSuperset(of: characterSet)
    }
    
    /**
     Formatea la cadena de texto a base64 si es posible.
     - Returns: Una nueva cadena, correspondiente al texto en base64, sino, retorna nil.
     */
    var base64Encoded: String? {
        let utf8 = self.data(using: .utf8)
        let base64 = utf8?.base64EncodedString()
        return base64
    }
    
    /**
     Devuelve un índice de tipo `Index` para la cadena a partir de un índice entero dado.
     - Parameter index: El índice entero a partir del cual se debe obtener el índice de cadena.
     - Returns: Un índice de tipo `Index` para la cadena a partir del índice entero especificado.
     */
    func index(from index: Int) -> Index {
        self.index(startIndex, offsetBy: index)
    }
    
    /**
     Devuelve una subcadena de la cadena original que se extiende sobre el rango especificado.
     - Parameter range: El rango de caracteres para la subcadena.
     - Returns: Una subcadena que abarca los caracteres en el rango especificado.
     */
    func substring(with range: Range<Int>) -> String {
        let startIndex = index(from: range.lowerBound)
        let endIndex = index(from: range.upperBound)
        return String(self[startIndex ..< endIndex])
    }
    
    /**
     La función devuelve una matriz de rangos ([Range<Index>]), que corresponden a las posiciones donde se encontró la subcadena dentro de la cadena de texto original. Si la subcadena no se encuentra en la cadena de texto original, se devuelve una matriz vacía.
     */
    func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        while let range = range(of: substring, options: options, range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex, locale: locale) {
            ranges.append(range)
        }
        return ranges
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
    }
    
    /**
     Remueve todos los espacios en blanco de la cadena de texto.
     - Returns: Una nueva cadena de texto sin espacios en blanco.
    */
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    /**
     Función que filtra y devuelve únicamente los caracteres numéricos de una cadena de texto.
     - Returns: Una cadena de texto que contiene únicamente caracteres numéricos.
     */
    func filterOnlyNumbers() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    /**
     Devuelve un valor booleano que indica si la cadena de texto contiene una subcadena dada, ignorando mayúsculas y acentos diacríticos.
     - Parameter substring: La subcadena que se desea buscar en la cadena de texto.
     - Returns: `true` si la cadena de texto contiene la subcadena dada, ignorando mayúsculas y acentos diacríticos; `false` en caso contrario.
     */
    func containsIgnoringCaseAndAccents(_ substring: String) -> Bool {
        let options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive]
        return range(of: substring, options: options) != nil
    }

    /**
     Retorna el número de ocurrencias de una subcadena dentro de una cadena.
     - Parameter string: La subcadena a buscar dentro de la cadena.
     - Returns: El número de ocurrencias de la subcadena.
    */
    func numberOfOccurrencesOf(_ string: String) -> Int {
        components(separatedBy: string).count - 1
    }
    
    /**
     Filtra los caracteres alfanuméricos de una cadena de texto y devuelve una nueva cadena con solo esos caracteres.
     - Returns: Una nueva cadena de texto que contiene únicamente caracteres alfanuméricos.
     */
    func filterAlphaNumeric() -> String {
        let validCharacters = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter { validCharacters.contains($0) }
    }
    
    /**
    Coloca en letra mayúscula en los índices indicados.
     - Parameter [Int]: Indices donde debe de colocarse la letra en mayúscula.
     - Returns: Una nueva cadena de texto con los valores indicados en mayúscula.
     */
    func capitalized(at characters: [Int]) -> String {
        if isEmpty { return "" }
        var formattedString = self
        for character in characters {
            if character < self.count {
                formattedString = formattedString.prefix(character) + String(self[index(startIndex, offsetBy: character)]).capitalized + formattedString.dropFirst(character + 1)
            }
        }
        return formattedString
    }
    
    /**
     Convierte una cadena de texto en formato JSON a un objeto.
     - Returns: Un objeto a partir de una cadena de texto en formato JSON.
     */
    func parseJsonString<T>(to type: T.Type) -> T? where T: Decodable {
        guard let data: Data = self.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
    
    /**
     Remueve texto no necesario de la cadena de error por defecto.
     - Returns: Una nueva cadena de texto reemplazado.
     */
    func replaceTextError() -> String {
        let errorMessage = self
            .replacingOccurrences(of: "lo sentimos, ", with: "")
            .replacingOccurrences(of: "Lo sentimos, ", with: "")
            .replacingOccurrences(of: "Lo sentimos ", with: "")
        return errorMessage.prefix(1).uppercased() + errorMessage.dropFirst()
    }
    
    /**
     Crea un NSAttributedString a partir de un String, aplicando un estilo en negrita a subcadenas específicas.
     - Parameters:
        - boldParts: Un arreglo de subcadenas que deben ser resaltadas en negrita.
        - regularFont: La fuente utilizada para el texto regular.
        - boldFont: La fuente utilizada para el texto en negrita.
        - regularColor: El color del texto regular. Por defecto es negro.
        - boldColor: El color del texto en negrita. Por defecto es negro.
     - Returns: Un NSAttributedString que combina texto en estilo regular y negrita según se especifica en `boldParts`.
     */
    func addBoldParts(
        boldParts: [String],
        regularFont: UIFont,
        boldFont: UIFont,
        regularColor: UIColor = .black,
        boldColor: UIColor = .black
    ) -> NSAttributedString {
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: regularColor
        ]
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: boldFont,
            .foregroundColor: boldColor
        ]
        let attributedString = NSMutableAttributedString(string: self, attributes: regularAttributes)
        for boldPart in boldParts {
            let ranges = self.ranges(of: boldPart)
            for range in ranges {
                attributedString.addAttributes(boldAttributes, range: NSRange(range, in: self))
            }
        }
        return attributedString
    }
    
    /// Obtiene la union del primer elemento de los N elementos de cada subsequencia divididos por el parámetro separator entonces retorna el resultado en mayusculas por default
    /// - Parameters:
    ///   - numberOfPrefix: numero de primeros elementos concatenados de las subsequencias
    ///   - separator: separador que dividira la cadena principal en sub-sequencias de los cuales se obtendra el primer elemento
    ///   - isUpperCased: retornara el resultado en mayusculas por true y minusculas por false
    /// - Returns: Concatenación del primer elemento de cada sub-sequencia
    func prefix(
        _ numberOfPrefix: Int,
        separetedBy separator: String,
        isUpperCased: Bool = true
    ) -> String {
        var prefix = ""
        let lsName = self.components(separatedBy: separator)
        let limitPrefix = min(lsName.count, numberOfPrefix)
        if limitPrefix <= 0 {
            return self
        }
        for index in 0 ..< limitPrefix {
            if let letter = lsName[safe: index]?.first?.uppercased() {
                prefix.append(letter)
            }
        }
        return isUpperCased ?  prefix.uppercased() : prefix.lowercased()
    }
    
}

