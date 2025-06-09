//
//  File.swift
//  
//
//  Created by Mollo Quicaño Donnadony on 12/09/24.
//

import Foundation

public struct LTUser: Codable {
    
    // MARK: - Properties
    
    public var userCodeEncoded: String?
    public var uniqueCode: String?
    public var fullName: String?
    public var codUser: String?
    public var email: String?
    public var local: String?
    public var image: String?
    public var career: String?
    public var campus: String?
    public var motherLastName: String?
    public var fatherLastName: String?
    public var isGea: Bool
    public var type: String?
    public var modality: String?
    public var cycle: String?
    public var faculty: String?
    public var typeDescription: String?
    public var enableCachimbo: Bool?
    public var course: String?
    public var photo: String?
    public var status: String?
    
    // MARK: - Lifecycle
    
    public init() {
        userCodeEncoded = nil
        uniqueCode = nil
        fullName = nil
        codUser = nil
        email = nil
        local = nil
        image = nil
        career = nil
        campus = nil
        motherLastName = nil
        fatherLastName = nil
        type = nil
        isGea = false
        modality = nil
        cycle = nil
        faculty = nil
        typeDescription = nil
        enableCachimbo = nil
        course = nil
        photo = nil
        status = nil
    }
    
}
