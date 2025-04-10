//
//  HomeModel.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 07/04/25.
//


import Foundation

struct HomeModel: Codable, Equatable {
    var status: Bool?
    var message: String?
    var tickets: [Ticket]?
    var pass: [pass]?
    var upcomingTrips: [UpcomingTrip]?
    
    static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        return lhs.status == rhs.status
        && lhs.message == rhs.message
        && lhs.tickets == rhs.tickets
        && lhs.pass == rhs.pass
        && lhs.upcomingTrips == rhs.upcomingTrips
    }
}

struct Ticket: Identifiable, Hashable,Codable {
    var id: Int?
    var bookingType: String?
    var image: String?
    var ticketType : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case bookingType, image,ticketType
    }
    
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.id == rhs.id
        && lhs.bookingType == rhs.bookingType
        && lhs.image == rhs.image
    }
}

struct pass: Identifiable, Hashable,Codable {
    var id: Int?
    var bookingType: String?
    var image: String?
    var ticketType : String?
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case bookingType, image ,ticketType
    }
    
    static func == (lhs: pass, rhs: pass) -> Bool {
        return lhs.id == rhs.id
        && lhs.bookingType == rhs.bookingType
        && lhs.image == rhs.image
    }
}






struct UpcomingTrip: Codable, Equatable,Hashable {
    let userid, bookingDate,ticketID,journeyDate: String?
    let fare: Float?
    let routeType: String?
    
    static func == (lhs: UpcomingTrip, rhs: UpcomingTrip) -> Bool {
        return lhs.userid == rhs.userid
        && lhs.bookingDate == rhs.bookingDate
        && lhs.journeyDate == rhs.journeyDate
        && lhs.ticketID == rhs.ticketID
        && lhs.fare == rhs.fare
        && lhs.routeType == rhs.routeType
    }
}

