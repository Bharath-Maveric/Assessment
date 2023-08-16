//
//  ContentView.swift
//  ABC TASK UI
//
//  Created by Yeddula Venkata Bharath Kumar Reddy on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var selectedImageIndex = 0
    
//    let images = ["Image1", "Image2", "Image3"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
    
                    TabView(selection: $selectedImageIndex) {
                        ForEach(ListDataProvider.getImages().indices, id: \.self) { index in
                            Image(ListDataProvider.getImages()[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 200)
                    .padding(.vertical)
                    CustomPageControl(numberOfPages: ListDataProvider.getImages().count, currentPage: $selectedImageIndex, dotColor: .gray, currentDotColor: .blue)
                        .onChange(of: selectedImageIndex) { _ in
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
              
                    SearchBarView(searchText: $searchText, isSearching: $isSearching)
                        .onChange(of: selectedImageIndex) { _ in
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
                    Text(ListDataProvider.getHeaderString(selectedImageIndex: selectedImageIndex))
                        .font(.headline)
                        .frame(alignment: .leading)
                        .padding()
                    VStack(alignment: .leading) {
                        ForEach(ListDataProvider.getFilteredListItems(
                            selectedListItems: ListDataProvider.getListItems(selectedImageIndex: selectedImageIndex), searchText: searchText)) { item in
                            ListItemRow(item: item)
                                .padding()
                        }
                    }
//                    VStack {
//                        if filteredListItems.count == 0 {
//                            HStack {
//                                Spacer()
//                                Text("No Data Found")
//                                    .padding()
//                                Spacer()
//                            }
//
//                        }
//                    }
                    .background(Color.white)
                    
                }
                .padding(.top)
            }
            .navigationBarTitle("Assessment")
            .offset(y: isSearching ? -30 : 0) // Pin search bar to top
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
