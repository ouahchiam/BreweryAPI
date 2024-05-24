//
//  BreweryDetailedView.swift
//  BreweryAPI
//
//  Created by Ouahchia, Mohamed (JD) on 24/05/2024.
//

import SwiftUI

struct BreweryDetailedView: View {
    @State var id: String
    @State private var brewery: Brewery? = nil
    @State private var stoicQuote: StoicQuote? = nil
    
    var body: some View {
        VStack {
            if let uBrewery = brewery {
                Text(uBrewery.name)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Text(uBrewery.websiteURL ?? "")
                    .font(.caption)
                Text("+1 \(uBrewery.phone)")
                    .font(.caption)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("Location")
                    .bold()
                    .font(.title2)
                Text(uBrewery.address1)
                if let address2 = uBrewery.address2 {
                    Text(address2)
                }
                if let address3 = uBrewery.address3 {
                    Text(address3)
                }
                Text(uBrewery.city)
                Text(uBrewery.postalCode)
                Text(uBrewery.state)
                Text(uBrewery.country)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("Special Quote")
                    .bold()
                    .font(.title2)
                Text(stoicQuote?.quote ?? "")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Text(stoicQuote?.author ?? "")
                    .font(.caption)
            } else {
                ProgressView()
            }
        }
            .onAppear {
                ApiManager.shared.getBreweryDetails(id: id) { Brewery in
                    self.brewery = Brewery
                    print(Brewery)
                }
                ApiManager.shared.getStoicQuote() { Quote in
                    self.stoicQuote = Quote
                }
            }
    }
}

#Preview {
    BreweryDetailedView(id: "b54b16e1-ac3b-4bff-a11f-f7ae9ddc27e0")
}
