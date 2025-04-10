//
//  HomeViewModel.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//


//import Alamofire
//import Foundation
//import Combine
//
//class HomeViewModel: ObservableObject {
//    @Published var homeModel: HomeModel?
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//
//    
//    func fetchDashboardData(userId: String) {
//        let url =  baseUrl + "dashboard?userid=\(userId)"
//
//        
//        isLoading = true
//           errorMessage = nil
//        print(url)
//           AF.request(url, method: .get)
//            .cURLDescription { print($0) }
//               .validate()
//               .responseDecodable(of: HomeModel.self) { response in
//                   self.isLoading = false
//                   
//                   switch response.result {
//                       
//                   case .success(let homeModel):
//                       print("Fetched HomeModel: \(homeModel)")
//                       print("Tickets: \(homeModel.tickets ?? [])")
//                       self.homeModel = homeModel
//                   case .failure(let error):
//                       print("Error fetching HomeModel: \(error)")
//                       self.errorMessage = error.localizedDescription
//                   }
//               }
//        
//    }
//}


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

