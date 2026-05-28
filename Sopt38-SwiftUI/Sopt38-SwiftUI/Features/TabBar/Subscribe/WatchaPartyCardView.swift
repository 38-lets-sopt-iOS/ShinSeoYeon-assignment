//
//  WatchaPartyCardView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

struct WatchaPartyCardView: View {
    
    let imageName: String
    let timeText: String
    let titleText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 196, height: 139)
                    .clipped()
                
                Image("watchaPartyNotiIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(.top, 12)
                    .padding(.trailing, 12)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(timeText)
                    .font(.body1)
                    .foregroundStyle(Color.watchaPink)
                
                Text(titleText)
                    .font(.subhead3)
                    .foregroundStyle(Color.watchaWhite)
            }
            .padding(.top, 8)
            .padding(.leading, 12)
            
            Spacer()
        }
        .frame(width: 196, height: 194)
        .background(Color.watchaGray600)
    }
}
