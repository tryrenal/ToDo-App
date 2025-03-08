//
//  SheetView.swift
//  ToDo App
//
//  Created by redveloper on 3/9/25.
//

import SwiftUI

struct SheetView: View {
    @Binding var showAddSheet: Bool
    @Binding var noteTitle: String
    @Binding var noteContent: String
    
    @ObservedObject private var viewModel = NoteViewModel.shared
    
    var body: some View{
        NavigationView{
            VStack(spacing: 30){
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.headline)
                    TextField(text: $noteTitle){
                        Text("Type a Note Title")
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading){
                    Text("Content")
                        .font(.headline)
                    TextField(text: $noteContent){
                        Text("Type a Note Content")
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                Button{
                    withAnimation{
                        viewModel.addNote(title: noteTitle, content: noteContent)
                        
                        noteTitle = ""
                        noteContent = ""
                        
                        showAddSheet = false
                    }
                } label: {
                    Text("Add a New Note")
                        .padding(5)
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationTitle(Text("Add a New Note"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    SheetView(
        showAddSheet: .constant(true), noteTitle: .constant("Title Note"), noteContent: .constant("Content Note")
    )
}
