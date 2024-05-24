//
//  ContentView.swift
//  BreweryAPI
//
//  Created by Ouahchia, Mohamed (JD) on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    @State private var results: [AutocompleteResult] = []
    
    @ObservedObject var apiManager = ApiManager.shared
    var body: some View {
        NavigationStack{
            TextField("Enter search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
                }
            Text("API Results:")
            List {
                ForEach(results, id:\.id) { result in
                    NavigationLink(result.name) {
                        BreweryDetailedView(id: result.id)
                    }
                }
            }
        }
        .navigationTitle("Breweries")
    }
}

#Preview {
    ContentView()
}
