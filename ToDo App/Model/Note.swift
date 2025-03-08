//
//  Note.swift
//  ToDo App
//
//  Created by redveloper on 3/8/25.
//

import Foundation

struct Note{
    let id: UUID = UUID()

    var title: String
    var content: String
    var createdAt: Date
}
