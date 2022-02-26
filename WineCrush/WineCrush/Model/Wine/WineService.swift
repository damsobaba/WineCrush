//
//  WineService.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 21/02/2022.
//
import Foundation

class WineService {
    
    // MARK: - Propreties
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClient()){
        self.httpClient = httpClient
    }
    
    // MARK: - Netwok call
    
    func getWineMatch(food: String, callback: @escaping (Result<[ProductMatch], NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.spoonacular.com/food/wine/pairing") else {return}
        httpClient.request(baseUrl: url, parameters: [("apiKey", "d9f5cf13992449569415797281fff104"),("food",food)])  { (result: Result<WineMatch, NetworkError>) in
            switch result {
            case .success(let data):
                callback(.success(data.productMatches))
            case .failure(let error):
                callback(.failure(error))
                
            }
            
        }
    }
}
