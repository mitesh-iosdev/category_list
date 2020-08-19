//
//  Category.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import RealmSwift

// MARK: Model

final class Category: Object, Decodable {
    @objc dynamic var data: String? = ""
    @objc dynamic var id = ""
    @objc dynamic var type = ""
    @objc dynamic var date: String? = ""

    private enum CodingKeys: String, CodingKey {
        case id
        case data
        case type
        case date
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        let data = try container.decodeIfPresent(String.self, forKey: .data) ?? ""
        self.data = data.trimmingCharacters(in: .whitespacesAndNewlines)
        self.date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? "other"
                
    }
}
