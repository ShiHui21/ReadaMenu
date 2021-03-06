//
//  BrowseRestaurants.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 6/5/22.
//

import SwiftUI

struct BrowseRestaurants: View {
    
    @State var search = ""
    
    @ObservedObject var restaurants = getRestaurants()
    
    var body: some View {
        
        List{
            //ForEach(0..<50) { i in Text("List of \(i)") }
            ForEach(self.restaurants.restaurants.filter{(self.search.isEmpty ? true: $0.name.localizedCaseInsensitiveContains(self.search))}, id: \.id) {
                i in NavigationLink(destination: BrowseCategories(restaurant: i)){
                    
                    VStack(alignment: .leading) {
                        Text(i.name).font(.title).bold()
                        Spacer()
                        Text(i.location).font(.subheadline).bold()
                        Spacer()
                        Text(i.description).font(.subheadline)
                    }.padding()
                }
            }.listRowInsets(.init(top: 50, leading: 50, bottom: 50, trailing: 50))
        }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always)) //search bar
        .navigationTitle("Restaurants")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct BrowseRestaurants_Previews: PreviewProvider {
//    static var previews: some View {
//        BrowseRestaurants()
//    }
//}
