//
//  Course.swift
//  Course List (Udemy iOS)
//
//  Created by Pedro Marques on 12/04/24.
//

import Foundation

struct Course: Identifiable, Codable {
    var id: Int
    var image: String
    var title: String
    var subtitle: String
//    var release_date: Date
}
