//
//  ListItemRow.swift
//  ABC TASK UI
//
//  Created by Yeddula Venkata Bharath Kumar Reddy on 11/08/23.
//

import SwiftUI

struct ListItemRow: View {
    var item: ListItem
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: 40, height: 40)
            Text(item.label)
                .padding()
        }
    }
}

