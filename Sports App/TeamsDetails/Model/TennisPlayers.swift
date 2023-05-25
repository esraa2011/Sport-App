//
//  TennisPlayers.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/7/23.
//

import Foundation
struct TennisPlayer: Decodable {
    let success: Int
    let result: [TennisPlayerResult]?
}

// MARK: - Result
struct TennisPlayerResult: Decodable {
    let player_key: Int
    let player_name, player_country, player_bday,player_logo: String?
   
}

