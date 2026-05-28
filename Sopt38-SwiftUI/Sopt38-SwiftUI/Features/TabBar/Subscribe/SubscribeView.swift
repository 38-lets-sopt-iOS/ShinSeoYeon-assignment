//
//  SubscribeView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

struct SubscribeView: View {
    
    private let subscribeData = [
        "saeroItem1",
        "saeroItem2",
        "saeroItem3",
        "saeroItem4"
    ]
    
    private let newContentData = [
        "garoItem1",
        "garoItem2",
        "garoItem3",
        "garoItem4"
    ]
    
    private let watgorithmData = [
        "saeroItem1",
        "saeroItem2",
        "saeroItem3",
        "saeroItem4"
    ]
    
    private let comingSoonData = [
        "saeroItem1",
        "saeroItem2",
        "saeroItem3",
        "saeroItem4"
    ]
    
    private let watchaPartyData: [(imageName: String, timeText: String, titleText: String)] = [
        ("garoItem1", "오늘 10:10에 시작", "# 크라임씬"),
        ("garoItem2", "오늘 11:10에 시작", "# 폭싹 속았수다"),
        ("garoItem3", "오늘 12:10에 시작", "# 왕과 사는 남자"),
        ("garoItem4", "오늘 14:10에 시작", "# 파묘")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.watchaBlack
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    headerView
                    
                    bigPosterSection
                        .padding(.top, 40)
                    
                    newContentSection
                        .padding(.top, 45)
                    
                    watgorithmSection
                        .padding(.top, 45)
                    
                    comingSoonSection
                        .padding(.top, 45)
                    
                    watchaPartySection
                        .padding(.top, 45)
                        .padding(.bottom, 120)
                }
            }
            
            floatingImageView
        }
    }
}

// MARK: - 헤더

private extension SubscribeView {
    
    var headerView: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                HStack(spacing: 20) {
                    Image("videoIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Image("notificationIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Image("profileIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .frame(height: 56)
            .padding(.horizontal, 22)
            
            HStack {
                Text("구독")
                    .font(.head1)
                    .foregroundStyle(Color.watchaWhite)
                
                Spacer()
            }
            .frame(height: 36)
            .padding(.horizontal, 22)
            
            Rectangle()
                .fill(Color.watchaGrayCustom3)
                .frame(height: 1)
                .padding(.top, 8)
        }
        .background(Color.watchaBlack)
    }
}

// MARK: - 섹션

private extension SubscribeView {
    
    var bigPosterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(subscribeData, id: \.self) { imageName in
                    PosterCardView(
                        imageName: imageName,
                        width: 273,
                        height: 399,
                        cornerRadius: 12
                    )
                }
            }
            .padding(.horizontal, 22)
        }
        .frame(height: 443)
    }
    
    var newContentSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("방금 막 도착한 신상 컨텐츠")
                .font(.head3)
                .foregroundStyle(Color.watchaWhite)
                .padding(.horizontal, 22)
            
            Text("예능부터 드라마까지!")
                .font(.subhead1)
                .foregroundStyle(Color.watchaGrayCustom2)
                .padding(.horizontal, 22)
                .padding(.top, 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(newContentData, id: \.self) { imageName in
                        PosterCardView(
                            imageName: imageName,
                            width: 321,
                            height: 180,
                            cornerRadius: 8
                        )
                    }
                }
                .padding(.horizontal, 22)
            }
            .frame(height: 180)
            .padding(.top, 20)
        }
    }
    
    var watgorithmSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("watgorithmImage")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .padding(.horizontal, 22)
            
            HStack {
                Text("예능부터 드라마까지!")
                    .font(.subhead1)
                    .foregroundStyle(Color.watchaGrayCustom2)
                
                Spacer()
                
                Text("더보기")
                    .font(.cap1)
                    .foregroundStyle(Color.watchaGrayCustom2)
            }
            .padding(.horizontal, 22)
            .padding(.top, 8.5)
            
            smallPosterHorizontalList(images: watgorithmData)
                .padding(.top, 20)
        }
    }
    
    var comingSoonSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("공개 예정 콘텐츠")
                    .font(.head3)
                    .foregroundStyle(Color.watchaWhite)
                
                Spacer()
                
                Text("더보기")
                    .font(.cap1)
                    .foregroundStyle(Color.watchaGrayCustom2)
            }
            .padding(.horizontal, 22)
            
            smallPosterHorizontalList(images: comingSoonData)
                .padding(.top, 20)
        }
    }
    
    var watchaPartySection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("왓챠 파티")
                    .font(.head3)
                    .foregroundStyle(Color.watchaWhite)
                
                Spacer()
                
                Text("더보기")
                    .font(.cap1)
                    .foregroundStyle(Color.watchaGrayCustom2)
            }
            .padding(.horizontal, 22)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(watchaPartyData, id: \.imageName) { item in
                        WatchaPartyCardView(
                            imageName: item.imageName,
                            timeText: item.timeText,
                            titleText: item.titleText
                        )
                    }
                }
                .padding(.horizontal, 22)
            }
            .frame(height: 195)
            .padding(.top, 20)
        }
    }
}

// MARK: - 재사용 뷰들

private extension SubscribeView {
    
    func smallPosterHorizontalList(images: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(images, id: \.self) { imageName in
                    PosterCardView(
                        imageName: imageName,
                        width: 103,
                        height: 153,
                        cornerRadius: 8
                    )
                }
            }
            .padding(.horizontal, 22)
        }
        .frame(height: 170)
    }
    
    var floatingImageView: some View {
        Image("floatingImage")
            .resizable()
            .scaledToFit()
            .frame(height: 86)
            .padding(.horizontal, 12)
            .padding(.bottom, 14)
    }
}

#Preview {
    SubscribeView()
}
