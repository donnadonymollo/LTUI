//
//  HeaderKey.swift
//
//
//  Created by Mollo Quicaño Donnadony on 13/08/24.
//

import Foundation

public enum HeaderKey: String {
    
    case authorization = "Authorization"
    case contentType = "Content-Type"
    case securityToken = "tokenSeguridad"
    case appKey
    case channelKey = "canalKey"
    case ipUsu
    case deviceType
    case version
    case userAgent = "User-Agent"
    case deviceId
    case ocpApimSubscriptionKey = "Ocp-Apim-Subscription-Key"
    case ocpApimTrace = "Ocp-Apim-Trace"
    case monitorData = "monitorData"
    case subscriptionKey = "subscription-key"
    case traceparent = "traceparent"
    case consumerId = "consumerId"
    case cardNumber = "cardNumber"
    case documentNumber = "documentNumber"
    case documentType = "documentType"
    case password = "password"
    case idToken = "idToken"
    case enrollmentId = "enrollmentId"
    case accountNumber = "accountNumber"
    case productsSession = "productsSession"
    case xInsertKey = "X-Insert-Key"
    case productIdentifier = "productIdentifier"
    case piggyBankAccountNumber = "piggyBankAccountNumber"
    case newRelicKey = "Api-Key"
    case sessionAppId
    case appVersion
    case responseDisbursement
    case productVersion = "product-version"
    case secVersion
    case productType = "productType"
    case subProductCode = "subProductCode"
    case lastUpdateProductCampaign = "lastUpdateProductCampaign"
    case authVersion = "auth-version"
    case productsVersion = "products-version"
    case lastUpdateLoginContent = "lastUpdateLoginContent"
    case productsOrder = "products-order"
    case productsInsurance = "products-insurance"
    case policyNumber = "policyNumber"
    case lastUpdateDCDigitalContent
    case entityCode
    case officeCode
    case operationId
    case financingNumber
    case currencyCode
    case apiVersion
    case cardId
    case deliveryChannel
    case selectTopFrequent
    case cardType
    case creditNumber
    case accountSavingsVersion = "accounts-savings-version"
    
}
