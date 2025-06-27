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
    public var roleId: String?
    public var levelDescription: String?
    public var periodCode: String?
    public var version: String?
    public var enrollmentPeriod: String?
    
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
        roleId = nil
        levelDescription = nil
        periodCode = nil
        version = nil
        enrollmentPeriod = nil
    }
    
    public init(
        userCodeEncoded: String? = nil,
        uniqueCode: String? = nil,
        fullName: String? = nil,
        codUser: String? = nil,
        email: String? = nil,
        local: String? = nil,
        image: String? = nil,
        career: String? = nil,
        campus: String? = nil,
        motherLastName: String? = nil,
        fatherLastName: String? = nil,
        isGea: Bool,
        type: String? = nil,
        modality: String? = nil,
        cycle: String? = nil,
        faculty: String? = nil,
        typeDescription: String? = nil,
        enableCachimbo: Bool? = nil,
        course: String? = nil,
        photo: String? = nil,
        status: String? = nil,
        roleId: String? = nil,
        levelDescription: String? = nil,
        periodCode: String? = nil,
        version: String? = nil,
        enrollmentPeriod: String? = nil
    ) {
        self.userCodeEncoded = userCodeEncoded
        self.uniqueCode = uniqueCode
        self.fullName = fullName
        self.codUser = codUser
        self.email = email
        self.local = local
        self.image = image
        self.career = career
        self.campus = campus
        self.motherLastName = motherLastName
        self.fatherLastName = fatherLastName
        self.isGea = isGea
        self.type = type
        self.modality = modality
        self.cycle = cycle
        self.faculty = faculty
        self.typeDescription = typeDescription
        self.enableCachimbo = enableCachimbo
        self.course = course
        self.photo = photo
        self.status = status
        self.roleId = roleId
        self.levelDescription = levelDescription
        self.periodCode = periodCode
        self.version = version
        self.enrollmentPeriod = enrollmentPeriod
    }
    
}
