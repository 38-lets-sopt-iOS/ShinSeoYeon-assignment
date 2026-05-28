//
//  PosterCardView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

struct PosterCardView: View {
    
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
    }
}
