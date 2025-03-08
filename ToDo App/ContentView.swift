//
//  ContentView.swift
//  ToDo App
//
//  Created by redveloper on 3/8/25.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject private var viewModel = NoteViewModel.shared

    @State private var showAddSheet: Bool = false
    @State private var noteTitle: String = ""
    @State private var noteContent: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                if(!viewModel.notes.isEmpty){
                    List{
                        ScrollView{
                            ForEach(viewModel.notes, id:\.id){ note in
                                
                                NavigationLink{
                                    NoteView(note: note)
                                }
                                label: {
                                    NoteComponent(title: note.title, content:note.content, createdAt: note.createdAt)
                                }
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                        Button(role: .destructive){
                                            withAnimation{
                                                viewModel.deleteNote(noteId: note.id)
                                            }
                                        } label: {
                                            Text("Delete")
                                        }
                                        .tint(.red)
                                        
                                    }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .listRowSeparator(.hidden)
                        .buttonStyle(.plain)
                    }
                    .listStyle(.plain)
                }
                else{
                    Text("🥲")
                        .font(.system(size: 45))
                    Text("No Notes Found")
                        .font(.system(size: 20, design: .rounded))
                }
            }
            .navigationTitle("Notes App")
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button{
                        withAnimation{
                            showAddSheet = true
                        }
                    }
                    label:{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50)
                            .symbolRenderingMode(.hierarchical)
                    }
                    .labelStyle(.iconOnly)
                }
            }
            .sheet(isPresented: $showAddSheet){
                SheetView(showAddSheet: $showAddSheet, noteTitle: $noteTitle, noteContent: $noteContent)
            }
        }
    }
}

#Preview {
    
    //for testing
    
    ContentView()
        .onAppear{
            if NoteViewModel.shared.notes.isEmpty {
                NoteViewModel.shared.addNote(title: "Test Title", content: "Test Content")
            }
        }
}






