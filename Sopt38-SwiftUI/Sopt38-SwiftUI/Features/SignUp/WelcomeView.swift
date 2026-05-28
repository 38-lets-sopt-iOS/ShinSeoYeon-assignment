//
//  WelcomeView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.watchaBlack
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                        .frame(height: 95)
                    
                    Image("watchaTitleImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 319, height: 167)
                    
                    Text("서연님\n가입을 환영합니다!")
                        .font(.head2)
                        .foregroundStyle(Color.watchaWhite)
                        .multilineTextAlignment(.center)
                        .padding(.top, 54)
                    
                    Spacer()
                    
                    NavigationLink {
                        MainTabView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("메인으로")
                            .font(.subhead1)
                            .foregroundStyle(Color.watchaWhite)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.watchaPink)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                    .padding(.horizontal, 22)
                    .padding(.bottom, 32)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
