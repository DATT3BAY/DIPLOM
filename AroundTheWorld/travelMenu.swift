//
//  fgsdg.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 21/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import AVKit
import UIKit
import AVFoundation
import SwiftUI
import MapKit

class SwiftUIViewHostingController2: UIHostingController<travelMenu> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: travelMenu())
    }
}

struct travelMenu: View {
    @StateObject var placeFinder = PlaceFinder()
    var body: some  View{
            ZStack(alignment: .bottom) {
            // Map view with markers of places
            Map(coordinateRegion: $placeFinder.region, annotationItems: placeFinder.spots) { spot in
                MapAnnotation(coordinate: spot.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    MapMarker(placeName: spot.name)
                }
            }
            .ignoresSafeArea()
            
        }
    }
    




struct PlaceCardView: View {
    let place: PlaceFinder.Place
    var body: some View{
        ZStack{
            Button("55555555") {
                       }
        }
    }
}


struct MapMarker: View {
    let placeName: String
    var body: some View{
        ZStack{
            Button("asdadad") {
                       }
        }
    }
}






class PlaceFinder: ObservableObject {
    @Published var spots = Data.places
    @Published var currentIndex = 0 {
        willSet {
            region.center = CLLocationCoordinate2D(
                latitude: spots[newValue].location.latitude - 0.05,
                longitude: spots[newValue].location.longitude)
        }
    }

    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Data.places[0].location.latitude, longitude: Data.places[0].location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @Published var selectedPlace: Place?



    struct Data {
        static let places = [
            Place(index: 0, name: "Мальдивы", date: "31.10.2020 - 6.11.2020", imageName: "Мальдивы", location: CLLocationCoordinate2D(latitude: 11.9672475, longitude: 121.9252489), departureDayLeft: "1 Days until departure", activities: activities1),
            Place(index: 1, name: "Дубаи", date: "1.9.2020 - 26.9.2020", imageName: "Дубаи", location: CLLocationCoordinate2D(latitude: 18.154504, longitude: -68.7120643), departureDayLeft: "15 Days until departure", activities: activities2),
            Place(index: 2, name: "Бора-Бора", date: "11.10.2020 - 16.10.2020", imageName: "Бора", location: CLLocationCoordinate2D(latitude: -0.76105, longitude: -90.333942), departureDayLeft: "1 Months until departure", activities: activities3)

        ]

        static let activities1 = [
            Activity(title: "FOUR SEASONS", imageName: "two_star", address: "Boracay Banwa it Malay, Lalawigan ng Aklan", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "SNORKLING", imageName: "snorkelers", address: "White Beach Boracay, Lalawigan ng Aklan", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "SURFING", imageName: "surfing", address: "Bulabog Beach, Malay, Philippines, Lalawigan ng Aklan", duration: "3 Hours", occupancy: "2 People", needBooking: true, price: "$29", previousPrice: "$59")
        ]

        static let activities2 = [
            Activity(title: "MELIA CARIBE", imageName: "melia", address: "Playas De Bavaro, Punta Cana 230001 Dominican Republic", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "ZIP LINE", imageName: "zip_line", address: "Nuestra Senora de la Altagracia", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "4x4 ATV", imageName: "ATV", address: "Bavaro Racing, Tours Point", duration: "8 Hours", occupancy: "2 People", needBooking: true, price: "$99", previousPrice: "$149")
        ]

        static let activities3 = [
            Activity(title: "VILLA TAINA", imageName: "melia", address: "Cabarete 57000 Dominican Republic", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "BIRD WATCHING", imageName: "bird", address: "Galápagos Islands, Ecuador", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
            Activity(title: "SNORKLING", imageName: "snorkelers", address: "Tortuga Bay, Ecuador", duration: "8 Hours", occupancy: "2 People", needBooking: true, price: "$49", previousPrice: "$79")
        ]
    }


    struct Place: Identifiable {
        let id = UUID()
        let index: Int
        let name: String
        let date: String
        let imageName: String
        let location: CLLocationCoordinate2D
        let departureDayLeft: String
        let activities: [Activity]
    }

    struct Activity: Identifiable {
        let id = UUID()
        let title: String
        let imageName: String
        let address: String
        let duration: String
        let occupancy: String
        let needBooking: Bool
        let price: String
        let previousPrice: String
    }
}
}
