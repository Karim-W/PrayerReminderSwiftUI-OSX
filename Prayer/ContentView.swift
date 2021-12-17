//
//  ContentView.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabBarView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
