//
//  HttpClient.swift
//  userConnection
//
//  Created by Adam Mabrouki on 24/02/2022.
//

import Foundation
final class HTTPClient {

    // MARK: - Properties
    
    private let httpEngine: HTTPEngine

    // MARK: - Initializer
    
    init(httpEngine: HTTPEngine = HTTPEngine(session: URLSession(configuration: .default))) {
        self.httpEngine = httpEngine
    }

    func request<T: Decodable>(baseUrl: URL, parameters: [String]?, callback: @escaping (Result<T, NetworkError>) -> Void) {
        postAction(userName: parameters![0], password: parameters![1],callback: callback)
//        httpEngine.request(baseUrl: baseUrl, parameters: parameters) { data, response, error in
//            guard let data = data, error == nil else {
//                callback(.failure(.undecodableData))
//                return
//            }
//            guard let response = response, response.statusCode == 200 else {
//                callback(.failure(.noResponse))
//                return
//            }
//            guard let dataDecoded = try? JSONDecoder().decode(T.self, from: data) else {
//                callback(.failure(.noData))
//                return
//            }
//            callback(.success(dataDecoded))
//        }
    }
    func postAction<T: Decodable>(userName: String, password: String, callback: @escaping (Result<T, NetworkError>) -> Void) {
        let Url = String(format: "https://debug.cobox.ai/connection")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["username" : userName, "password" : password]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
        
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    callback(.success((json as! Dictionary<String, Any>)["authentified"] as! T))
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
