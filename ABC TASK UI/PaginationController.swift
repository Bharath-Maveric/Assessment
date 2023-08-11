//
//  PaginationController.swift
//  ABC TASK UI
//
//  Created by Yeddula Venkata Bharath Kumar Reddy on 11/08/23.
//

import SwiftUI

struct CustomPageControl: UIViewRepresentable {
    var numberOfPages: Int
    var currentPage: Binding<Int>
    var dotColor: UIColor
    var currentDotColor: UIColor
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage.wrappedValue
        pageControl.pageIndicatorTintColor = dotColor
        pageControl.currentPageIndicatorTintColor = currentDotColor
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage.wrappedValue
    }
}
