//
//  SearchBar.swift
//  ABC TASK UI
//
//  Created by Yeddula Venkata Bharath Kumar Reddy on 11/08/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText, onEditingChanged: { editing in
                isSearching = editing
            }, onCommit: {
                // Perform search logic here
            })
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            if isSearching {
                Button(action: {
                    searchText = ""
                    UIApplication.shared.dismissKeyboard()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                }
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
        }
        .padding(.horizontal)
    }
}
