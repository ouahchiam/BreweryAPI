//
//  Brewery.swift
//  BreweryAPI
//
//  Created by Ouahchia, Mohamed (JD) on 24/05/2024.
//

import Foundation

import Foundation

struct Brewery: Codable {
    let id: String
    let name: String
    let breweryType: String
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let stateProvince: String
    let postalCode: String
    let country: String
    let longitude: String
    let latitude: String
    let phone: String
    let websiteURL: String?
    let state: String
    let street: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case breweryType = "brewery_type"
        case address1 = "address_1"
        case address2 = "address_2"
        case address3 = "address_3"
        case city
        case stateProvince = "state_province"
        case postalCode = "postal_code"
        case country
        case longitude
        case latitude
        case phone
        case websiteURL = "website_url"
        case state
        case street
    }
}
