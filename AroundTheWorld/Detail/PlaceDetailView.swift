//
//  PlaceDetailView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI

struct PlaceDetailView: View {
    @ObservedObject var placeFinder: PlaceFinder
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .ignoresSafeArea()
            } else {
                // Откат к более ранним версиям
                
            }
            VStack {
                // Навигация по странам
                TopNavigationView(placeFinder: placeFinder)
                ScrollView(.vertical, showsIndicators: false) {
                    FlightView()
                    // Просмотр действий
                    ForEach(placeFinder.selectedPlace?.activities ?? []) { activity in
                        ActivityView(activity: activity)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
