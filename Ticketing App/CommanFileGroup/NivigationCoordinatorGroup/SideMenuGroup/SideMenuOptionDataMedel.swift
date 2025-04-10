//
//  SideMenuOptionDataMedel.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 08/04/25.
//



import Foundation

enum SideMenuOptionDataMedel : Int, CaseIterable {
    case DownloadTicket = 0
    case profile = 1
    case RtdcPolicy = 2
    case logout = 3
   
    
    var title: String {
        switch self {
        case .DownloadTicket:
            return "My Tickets"
        case .profile:
            return "Update Profile"
       
    case .RtdcPolicy:
        return "Privacy & Policy"
        case .logout:
            return "Logout"
       
        
   
    }
    }

    var systemImageName: String {
        switch self {
        case .DownloadTicket:
            return "square.and.arrow.down"
        case .profile:
            return "person.crop.circle"
       
        case .RtdcPolicy:
            return "doc.plaintext"
        case .logout:
            return "person"
     
    }
    }
}

extension SideMenuOptionDataMedel : Identifiable {
    var id: Int {
        return self.rawValue
    }
}

