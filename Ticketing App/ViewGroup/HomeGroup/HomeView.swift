//
//  DashboardView.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 04/04/25.
//


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isSearchActive = false
    @State private var searchText = ""
    @State private var ShowMenu = false
    
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
                        .padding(.horizontal)
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
                                        .padding(.top)
                                }
                            }
                        }
                    }
                }
                
                .onAppear {
                    
                    let storedId = UserDefaultsData.getUserStrId()
                    print("🧾 userId from UserDefaults: \(storedId ?? "nil")")
                    
                    if let userId = storedId {
                        viewModel.fetchDashboardData(userId: userId)
                    }
                    
                    
                }
                
            }
            
            .navigationBarBackButtonHidden(true)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Button(action: {
                            // Handle menu action
                            withAnimation {
                                ShowMenu.toggle()
                            }
                            
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        
                        Text("Welcome, Sarfaraz")
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
            
        }
    
    }
}

