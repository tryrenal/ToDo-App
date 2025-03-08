//
//  NoteView.swift
//  ToDo App
//
//  Created by redveloper on 3/9/25.
//

import SwiftUI

struct NoteView: View {
    @ObservedObject private var viewModel = NoteViewModel.shared
    @Environment(\.presentationMode) private var presentationMode

    var note: Note
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16){
                Text(note.title)
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundStyle(.primary)
                
                Text(note.content)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.secondary)
                
                HStack{
                    Text("Created: ")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Text(note.createdAt, style: .date)
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .padding(.top, 8)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
            )
        }
        .background(Color(.secondarySystemBackground))
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Menu{
                    Button{
                        viewModel.deleteNote(noteId: note.id)
                    }
                    label: {
                        Text("Delete")
                    }
                }
                label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        NoteView(note: Note(title: "Title Note", content: "Content Title", createdAt: Date.now))
    }
}
