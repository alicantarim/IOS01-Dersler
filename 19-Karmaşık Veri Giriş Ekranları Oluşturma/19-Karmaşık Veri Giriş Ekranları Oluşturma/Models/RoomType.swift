//
//  RoomType.swift
//  19-Karmaşık Veri Giriş Ekranları Oluşturma
//
//  Created by Alican TARIM on 19.03.2024.
//

import Foundation

struct RoomType: Equatable {
    
    // MARK: - Properties
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    // MARK: - Functions
    static func == (lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
