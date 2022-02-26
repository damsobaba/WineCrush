//
//  connectionService.swift
//  userConnection
//
//  Created by Adam Mabrouki on 24/02/2022.
//

import Foundation



class ConnectionService {
    // MARK: - Propreties
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClient()){
        self.httpClient = httpClient
    }
    
    // MARK: - Netwok call
    
    func getCamera(username: String, password: String, callback: @escaping (Result<Bool, NetworkError>) -> Void) {
        guard let url = URL(string: "https://debug.cobox.ai/connection") else {return}
        httpClient.request(baseUrl: url, parameters: [username,password])  { (result: Result<Bool, NetworkError>) in
            switch result {
            case .success(let data):
                callback(.success(data))
            case .failure(let error):
                callback(.failure(error))
                
            }
            
        }
    }

}
