//
//  Countries.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 31/10/23.
//
enum Country {
    case jordan
    case palestine
    case egypt
    case lebanon
    case unitedArabEmirates
    case qatar
    case bahrain
    case algeria

    var icon: String {
        switch self {
        case .jordan: return "jordan"
        case .palestine: return "palestine"
        case .egypt: return "egypt"
        case .lebanon: return "lebanon"
        case .unitedArabEmirates: return "united-arab-emirates"
        case .qatar: return "qatar"
        case .bahrain: return "bahrain"
        case .algeria: return "algeria"
        }
    }

    var title: String {
        switch self {
        case .jordan: return "Jordan"
        case .palestine: return "Palestine"
        case .egypt: return "Egypt"
        case .lebanon: return "Lebanon"
        case .unitedArabEmirates: return "United Arab Emirates"
        case .qatar: return "Qatar"
        case .bahrain: return "Bahrain"
        case .algeria: return "Algeria"
        }
    }
}
