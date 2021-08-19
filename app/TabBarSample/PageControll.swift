//
//  PageControll.swift
//  TabBarSample
//
//  Created by Shinya Ema on 2021/08/19.
//

import SwiftUI

struct PageControll: UIViewRepresentable {
    let maxPages: Int
    let currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl{
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
}

