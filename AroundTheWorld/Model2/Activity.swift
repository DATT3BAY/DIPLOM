//
//  Activity.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let short: String
    let needBooking: Bool    
    let bookAct: String
    let bookBook: String
}

