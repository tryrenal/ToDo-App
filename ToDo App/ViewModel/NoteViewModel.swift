//
//  NoteViewModel.swift
//  ToDo App
//
//  Created by redveloper on 3/8/25.
//

import Foundation

final class NoteViewModel: ObservableObject {
    static let shared = NoteViewModel()
    
    @Published var notes: [Note] = []
    
    @MainActor
    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content, createdAt: Date.now)
        notes.append(newNote)
    }
    
    @MainActor
    func deleteNote(noteId: UUID) {
        notes.removeAll{ foundNote in
            foundNote.id == noteId
        }
    }
}
