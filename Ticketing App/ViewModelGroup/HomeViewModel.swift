//
//  HomeViewModel.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 07/04/25.
//


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var homeModel: HomeModel?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchDashboardData(userId: String) {
        isLoading = true
        errorMessage = nil

        APIService.shared.request(
            from: .dashboard(userId: userId),
            responseType: HomeModel.self
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let model):
                    print("Fetched HomeModel: \(model)")
                    self?.homeModel = model
                case .failure(let error):
                    print("Error fetching HomeModel: \(error)")
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

