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
    
    let images = ["Image1", "Image2", "Image3"] //
    
    var listItems: [ListItem] {
        // Return different list content based on selectedImageIndex
        switch selectedImageIndex {
        case 0:
            return [ListItem(imageName: "Stocks", label: "Eicher Motors"), ListItem(imageName: "Stock", label: "ITC Limited"), ListItem(imageName: "Stocks", label: "Grasim Industries"), ListItem(imageName: "Stock", label: "Coal India"), ListItem(imageName: "Stocks", label: "Divi's Laboratories")]
        case 1:
            return [ListItem(imageName: "Banks", label: "ICICI Bank"), ListItem(imageName: "Bank", label: "Axis Bank"), ListItem(imageName: "Banks", label: "Kotak Bank"), ListItem(imageName: "Bank", label: "HDFC Bank"), ListItem(imageName: "Banks", label: "SBI Bank"), ListItem(imageName: "Banks", label: "Yes Bank"), ListItem(imageName: "Banks", label: "DBS Bank"), ListItem(imageName: "Banks", label: "IndusInd Bank"), ListItem(imageName: "Banks", label: "ABC Bank"), ListItem(imageName: "Bank", label: "Bank of Baroda"), ListItem(imageName: "Bank", label: "Citi Bank"), ListItem(imageName: "Banks", label: "UCO Bank")]
        case 2:
            return [ListItem(imageName: "ATMs", label: "ICICI Bank ATM"), ListItem(imageName: "ATM", label: "Axis Bank ATM"), ListItem(imageName: "ATMs", label: "Kotak Bank ATM"), ListItem(imageName: "ATMs", label: "HDFC Bank ATM"), ListItem(imageName: "ATMs", label: "SBI Bank ATM"), ListItem(imageName: "ATMs", label: "Yes Bank ATM"), ListItem(imageName: "ATM", label: "DBS Bank ATM"), ListItem(imageName: "ATMs", label: "IndusInd Bank ATM"), ListItem(imageName: "ATMs", label: "ABC Bank ATM"), ListItem(imageName: "ATM", label: "Bank of Baroda ATM"), ListItem(imageName: "ATMs", label: "Citi Bank ATM"), ListItem(imageName: "ATMs", label: "UCO Bank ATM")]
        default:
            return []
        }
    }
    
    var headerString: String {
        switch selectedImageIndex {
        case 0:
            return "Stocks"
        case 1:
            return "Banks"
        case 2:
            return "ATMs"
        default:
            return ""
        }
    }
    
    
    var filteredListItems: [ListItem] {
        let selectedListItems = listItems
        
        if searchText.isEmpty {
            return selectedListItems
        } else {
            return selectedListItems.filter {
                $0.label.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Images Carousel
                    TabView(selection: $selectedImageIndex) {
                        ForEach(images.indices, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 200)
                    .padding(.vertical)
                    CustomPageControl(numberOfPages: images.count, currentPage: $selectedImageIndex, dotColor: .gray, currentDotColor: .blue)
                        .onChange(of: selectedImageIndex) { _ in
                            searchText = "" // Reset search text when image changes
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // Hide keyboard
                        }
                    
                    // Search Bar
                    SearchBarView(searchText: $searchText, isSearching: $isSearching)
                        .onChange(of: selectedImageIndex) { _ in
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    //Header
                    Text(headerString)
                        .font(.headline)
                        .frame(alignment: .leading)
                        .padding()
                    // List
                    VStack(alignment: .leading) {
                        ForEach(filteredListItems) { item in
                            //                            HStack {
                            //                                Image(headerString)
                            //                                    .resizable()
                            //                                    .frame(width: 40, height: 40)
                            //                                Text(item.label)
                            //                                    .padding()
                            //                            }
                            ListItemRow(item: item)
                                .padding()
                        }
                    }
                    VStack {
                        if filteredListItems.count == 0 {
                            HStack {
                                Spacer()
                                Text("No Data Found")
                                    .padding()
                                Spacer()
                            }
                            
                        }
                    }
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
