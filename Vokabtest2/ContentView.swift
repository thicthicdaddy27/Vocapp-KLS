//
//  ContentView.swift
//  Vokabtest2
//
//  Created by Luca Scheller on 22.02.22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var Eingabe: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    


    var body: some View {
        NavigationView {
            
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp!, formatter: itemFormatter) with \(item.deutsch ?? "Test") as \(item.englisch ?? "Test2")")
                           
                        } label: {
                            Text(item.timestamp!, formatter: itemFormatter)
                        }
                        
                    }
                    .onDelete(perform: deleteItems)
                }
                
                
                

                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                    
                }
                Text("Select an item")
                
            
            }
        Form {
            TextField(text: $Eingabe, prompt: Text("Eingabe")) {
                Text("Deutsch")
            }
            
        }
            }
            
            
        
    struct SecondLevelView: View {
        var body: some View {
            VStack {
                Text("Second level")
                    .font(.largeTitle)
                NavigationLink("Third level", destination: {
                    ThirdLevelView()
                })
    } }
    }
    struct ThirdLevelView: View {
        var body: some View {
            VStack {
                Text("Third level")
                    .font(.largeTitle)
    } }
    }
    

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.deutsch = "Zwei"
            newItem.englisch = "two"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
