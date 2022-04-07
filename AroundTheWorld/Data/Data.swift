//
//  Data.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI
import MapKit

struct Data {
    static let places = [
        Place(index: 0, name: "Мальдивы", definition: "Райская лагуна", imageName: "Мальдивы", location: CLLocationCoordinate2D(latitude: 4.175490, longitude: 73.509300), seat: "Южная Азия", activities: activities1),
        Place(index: 1, name: "Бора-Бора", definition: "Вдали от цивилизации", imageName: "Бора", location: CLLocationCoordinate2D(latitude: 16.496748, longitude: 151.7348328), seat: "Французская Полинезия", activities: activities2),
        Place(index: 2, name: "Дубаи", definition: "Архитектурное величие", imageName: "Дубаи", location: CLLocationCoordinate2D(latitude: 25.074282349999997, longitude: 55.18853865430702), seat: "ОАЭ", activities: activities3)
    
    ]
    
    static var activities1 = [
        Activity(title: "Сводка", imageName: "сводка", short: "Ознакомьтесь со страной(местом)",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Интересное", imageName: "интересное", short: "Найдите что-то интересное для себя",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Достопримечательности", imageName: "достопримечательности", short: "Погрузитесь в тур по достопримечательностям",  needBooking: true, bookAct: "0", bookBook: "0")
    ]
    
    static let activities2 = [
        Activity(title: "Сводка", imageName: "сводка", short: "Ознакомьтесь со страной(местом)",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Интересное", imageName: "интересное", short: "Найдите что-то интересное для себя",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Достопримечательности", imageName: "достопримечательности", short: "Погрузитесь в тур по достопримечательностям",  needBooking: true, bookAct: "0", bookBook: "0")
    ]
    
    static let activities3 = [
        Activity(title: "Сводка", imageName: "сводка", short: "Ознакомьтесь со страной(местом)",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Интересное", imageName: "интересное", short: "Найдите что-то интересное для себя",  needBooking: false, bookAct: "0", bookBook: "0"),
       Activity(title: "Достопримечательности", imageName: "достопримечательности", short: "Погрузитесь в тур по достопримечательностям",  needBooking: true, bookAct: "0", bookBook: "0")
    ]
}
