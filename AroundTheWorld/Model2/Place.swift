//
//  Place.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let definition: String
    let imageName: String
    let location: CLLocationCoordinate2D
    let seat: String
    let activities: [Activity]    
}
