//
//  PlaceCardView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//
import SwiftUI

@available(iOS 14.0, *)
struct PlaceCardView: View {
    @Environment(\.openURL) var openURL
    let place: Place
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(place.imageName)
                    .resizable()
                    .frame(height: 300)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.system(size: 44, weight: .bold))
                    
                    HStack {
                        Text(place.definition)
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                ) // Чтобы текст легко читался перед белым изображением
            }
            
            HStack {
                Button("Подробнее"){ openURL(URL(string: "https://clck.ru/ecL7b")!)}
                Text(place.seat)
                Spacer()
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
            }
            .padding()
            .background(Color.white)
        }
        .cornerRadius(20)
    }
}

