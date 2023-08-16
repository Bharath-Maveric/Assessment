//
//  ListedItemContent.swift
//  ABC TASK UI
//
//  Created by Yeddula Venkata Bharath Kumar Reddy on 16/08/23.
//

import Foundation

struct ListDataProvider {
    
    static func getImages() -> [String] {
        var images = [String]()
        images = ["Image1", "Image2", "Image3"]
        return images
    }
    
    static func getListItems(selectedImageIndex: Int) -> [ListItem] {
        switch selectedImageIndex {
        case 0:
            return [
                ListItem(imageName: "Stocks", label: "Eicher Motors"),
                ListItem(imageName: "Stock", label: "ITC Limited"),
                ListItem(imageName: "Stocks", label: "Grasim Industries"),
                ListItem(imageName: "Stock", label: "Coal India"),
                ListItem(imageName: "Stocks", label: "Divi's Laboratories")
            ]
        case 1:
            return [
                ListItem(imageName: "Banks", label: "ICICI Bank"),
                ListItem(imageName: "Bank", label: "Axis Bank"),
                ListItem(imageName: "Banks", label: "Kotak Bank"),
                ListItem(imageName: "Bank", label: "HDFC Bank"),
                ListItem(imageName: "Banks", label: "SBI Bank"),
                ListItem(imageName: "Banks", label: "Yes Bank"),
                ListItem(imageName: "Banks", label: "DBS Bank"),
                ListItem(imageName: "Banks", label: "IndusInd Bank"),
                ListItem(imageName: "Banks", label: "ABC Bank"),
                ListItem(imageName: "Bank", label: "Bank of Baroda"),
                ListItem(imageName: "Bank", label: "Citi Bank"),
                ListItem(imageName: "Banks", label: "UCO Bank")
            ]
        case 2:
            return [
                ListItem(imageName: "ATMs", label: "ICICI Bank ATM"),
                ListItem(imageName: "ATM", label: "Axis Bank ATM"),
                ListItem(imageName: "ATMs", label: "Kotak Bank ATM"),
                ListItem(imageName: "ATMs", label: "HDFC Bank ATM"),
                ListItem(imageName: "ATMs", label: "SBI Bank ATM"),
                ListItem(imageName: "ATMs", label: "Yes Bank ATM"),
                ListItem(imageName: "ATM", label: "DBS Bank ATM"),
                ListItem(imageName: "ATMs", label: "IndusInd Bank ATM"),
                ListItem(imageName: "ATMs", label: "ABC Bank ATM"),
                ListItem(imageName: "ATM", label: "Bank of Baroda ATM"),
                ListItem(imageName: "ATMs", label: "Citi Bank ATM"),
                ListItem(imageName: "ATMs", label: "UCO Bank ATM")
            ]
        default:
            return []
        }
    }
    
    static func getHeaderString(selectedImageIndex: Int) -> String {
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
    
    static func getFilteredListItems(selectedListItems: [ListItem], searchText: String) -> [ListItem] {
        if searchText.isEmpty {
            return selectedListItems
        } else {
            return selectedListItems.filter {
                $0.label.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
