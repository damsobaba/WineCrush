//
//  NetworkError.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 21/02/2022.
//

import Foundation
/// error case
enum NetworkError: Error, CustomStringConvertible {
    case noData
    case noResponse
    case undecodableData

    var description: String {
        switch self {
        case .noData:
            return "There is no data !"
        case .noResponse:
            return "Response status is incorrect !"
        case .undecodableData:
            return "Data can't be decoded !"
        }
    }
}
