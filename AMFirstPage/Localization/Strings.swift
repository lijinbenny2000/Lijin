//
//  Strings.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 31/10/23.
//

import Foundation

enum Strings: String{
    case jordan
    case palestine
    case egypt
    case lebanon
    case qatar
    case uae
    case algeria
    case beharain
    
    case english
    case arabic

    case testUserButton
    case loginButton
    case changeCountryButton
    case forgotButton
    case usernamePlaceholder
    case passwordPlaceholder
    
    
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
        }
    }

