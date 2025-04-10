//
//  APIService.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    private init() {}

    private var cancellables = Set<AnyCancellable>()

    func request<T: Decodable>(
        from endpoint: APIEndpoint,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = endpoint.url else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completionStatus in
                if case let .failure(error) = completionStatus {
                    completion(.failure(error))
                }
            } receiveValue: { response in
                completion(.success(response))
            }
            .store(in: &cancellables)
    }
}

