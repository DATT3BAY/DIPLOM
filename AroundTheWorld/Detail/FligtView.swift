//
//  FligtView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI

struct FlightView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(height: 230)
            
            VStack(alignment: .center, spacing: 40) {
                HStack(spacing: 22) {
                    Spacer()
                    FlightItemView1 (foreword1:  "Здесь вы можете найти описание, посмотреть на достопримечательности, развлечения и многое другое")
                    Spacer()
                    }
                
                    FlightItemView2( foreword2:  "Приятного изучения!")
                   Spacer()
                }

            }.padding()
        }
    }


struct FlightItemView1: View {
    let foreword1: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(foreword1)
                .font(.system(size: 20, weight: .semibold))
        }
    }
}

struct FlightItemView2: View {
    let foreword2: String
    var body: some View {
        VStack(alignment: .leading) {
         Text(foreword2)
                .font(.system(size: 20, weight: .regular))
        }
    }
}
