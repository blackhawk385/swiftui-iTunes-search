//
//  ContentView.swift
//  SearchStore
//
//  Created by VenD on 1/3/23.
//

import SwiftUI

struct ContentView: View {
            @StateObject private var viewModel = SearchViewModel()
    @State private var queryString: String = ""
    @State private var favoriteColor = "Red"
        var colors = ["Red", "Green", "Blue"]

    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                    //            List(viewModel.repos) { repo in
//                HStack {
//                    Text(viewModel.searchReasult.description)
//                }
                VStack {
                Picker("What is your favorite color?", selection: $favoriteColor) {
                               ForEach(colors, id: \.self) {
                                   Text($0)
                               }
                           }
                           .pickerStyle(.segmented)

                           Text("Value: \(favoriteColor)")
                }
            }
            .searchable(text: $queryString, prompt: "Search...").onAppear() {
                viewModel.performSearch(query: self.queryString, category: Category("all"))
                
            }
        } else {
            Text("Search Widget N/A on version 14 or lower")
        }
        
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
