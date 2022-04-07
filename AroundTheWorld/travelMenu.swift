//
//  fgsdg.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 21/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI
import MapKit


class SwiftUIViewHostingController2: UIHostingController<travelMenu> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: travelMenu())
    }
}

struct travelMenu: View {
    @StateObject var placeFinder = PlaceFinder()
       var body: some View {
           ZStack(alignment: .bottom) {
               //Вид карты с маркерами мест
               if #available(iOS 14.0, *) {
                   Map(coordinateRegion: $placeFinder.region, annotationItems: placeFinder.spots) { spot in
                       MapAnnotation(coordinate: spot.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                           MapMarker(placeName: spot.name)
                       }
                   }
                   .ignoresSafeArea()
               } else {
                   // Откат к более ранним версиям
               }
               // Просмотр карты с местом
               PagerView(
                   count: placeFinder.spots.count,
                   index: $placeFinder.currentIndex,
                   viewWidth: UIScreen.screenWidth - 40,
                   content: {
                   ForEach(placeFinder.spots) { place in
                       if #available(iOS 14.0, *) {
                           PlaceCardView(place: place)
                               .frame(width: UIScreen.screenWidth - 60, height: 380)
                               .onTapGesture {
                                   withAnimation {
                                       placeFinder.selectedPlace = place
                                   }
                               }
                       } else {
                           // Откат к более ранним местам
                       }
                   }
               })
                   .opacity(placeFinder.selectedPlace == nil ? 1.0 : 0.0)
               
               
               if placeFinder.selectedPlace != nil {
                   // Размещение подробности
                   PlaceDetailView(placeFinder: placeFinder)
               }
           }
           .onAppear {
               placeFinder.currentIndex = 0
           }
       }
   }

   extension UIScreen {
      static let screenWidth   = UIScreen.main.bounds.size.width
      static let screenHeight  = UIScreen.main.bounds.size.height
      static let screenSize    = UIScreen.main.bounds.size
   }
