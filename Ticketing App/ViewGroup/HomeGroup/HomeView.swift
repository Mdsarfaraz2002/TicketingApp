//
//  DashboardView.swift
//  Ticketing App
//
//  Created by Mohd Sarfaraz  on 04/04/25.
//


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isSearchActive = false
    @State private var searchText = ""
    @State private var ShowMenu = false

    let passedId = "Upcoming Bookings"
       let passedName = "Janeshwar Mishra Park"
       
       // The expected values to match
       let expectedId = "Upcoming Bookings"
       let expectedName = "Janeshwar Mishra Park"
    
    @State private var paymentFailed = false
    
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0)  {
                    
                    if isSearchActive {
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                
                                TextField("Search...", text: $searchText)
                                    .foregroundColor(.primary)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                
                                if !searchText.isEmpty {
                                    Button(action: {
                                        searchText = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 3)
                            
                        }
                        .padding(.horizontal,6)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .animation(.easeInOut, value: isSearchActive)
                    }
                    if let model = viewModel.homeModel {
                        if let tickets = model.tickets {
                            let filteredTickets = tickets.filter {
                                searchText.isEmpty || ($0.bookingType?.localizedCaseInsensitiveContains(searchText) ?? false)
                            }
                            
                            if filteredTickets.isEmpty {
                                Text("No results found")
                                    .foregroundColor(.gray)
                                    .padding(.top, 50)
                                    .transition(.opacity)
                            } else {
                                ForEach(filteredTickets, id: \.self) { ticket in
                                    ParkCardView(ticket: ticket)
                                        .padding(.top,6)
                                }
                            }
                        }
                    }
                }
                
                .onAppear {
                    let storedId = UserDefaultsData.getUserStrId()
                    print("userId from UserDefaults: \(storedId ?? "nil")")
                    
                    if let userId = storedId {
                        viewModel.fetchDashboardData(userId: userId)
                    }
                    
                }
                
            }
            
            
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Button(action: {
                            withAnimation {
                                ShowMenu.toggle()
                            }
                            
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                        }
                        let userName = UserDefaultsData.getUserName()
                        Text("Welcome, \(userName ?? "user")")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isSearchActive.toggle()
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                }
            }
            .toolbar(ShowMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar(ShowMenu ? .hidden : .visible, for: .tabBar)
            SideMenuView(isShowing: $ShowMenu, isLoggedIn: $ShowMenu)
            
            if shouldShowPopup(id: passedId, name: passedName) {
                
                LastBookingCardView()
                    .padding(.vertical,6)
                
                
            }
            
            
        }.animation(.easeInOut, value: shouldShowPopup(id: passedId, name: passedName))
            .onAppear {
                simulatePayment()
            }
            .sheet(isPresented: $paymentFailed) {
                PaymentFailedView()
                    .presentationDetents([.medium]) // Optional: restrict to medium height
            }
        
    }
    
    func shouldShowPopup(id: String, name: String) -> Bool {
            return id == expectedId && name == expectedName
        }
    
    
    func simulatePayment() {
        // Simulate a network call delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let paymentSuccess = Bool.random() // Simulate success/failure
            
            if !paymentSuccess {
                paymentFailed = true // Will trigger fullScreenCover
            } else {
                print("✅ Payment Success")
            }
        }
    }
}






