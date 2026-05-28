//
//  MainTabView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            SubscribeView()
                .tabItem {
                    Image("subscribeTabIcon")
                }
            
            PlaceholderView(title: "개별 구매")
                .tabItem {
                    Image("purchaseTabIcon")
                }
            
            PlaceholderView(title: "웹툰")
                .tabItem {
                    Image("webtoonTabIcon")
                }
            
            PlaceholderView(title: "찾기")
                .tabItem {
                    Image("searchTabIcon")
                }
            
            PlaceholderView(title: "보관함")
                .tabItem {
                    Image("libraryTabIcon")
                }
        }
        .tint(.watchaWhite)
    }
}

private struct PlaceholderView: View {
    
    let title: String
    
    var body: some View {
        ZStack {
            Color.watchaBlack
                .ignoresSafeArea()
            
            Text(title)
                .font(.head2)
                .foregroundStyle(Color.watchaWhite)
        }
    }
}

#Preview {
    MainTabView()
}
