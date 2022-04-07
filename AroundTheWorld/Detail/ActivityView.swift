//
//  ActivityView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI

struct DetailView1: View{
    var body: some View{
        Text("1")
    }
}

struct DetailView2: View{
    var body: some View{
        Text("2")
    }
}

struct DetailView3: View{
    var body: some View{
        Text("3")
    }
}


struct ActivityView: View {
    @State private var showingDetail1 = false
    @State private var showingDetail2 = false
    let activity: Activity

    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomLeading) {
                HStack{
                Button(action:  {
                    self.showingDetail1.toggle()
                }){
                // Изображение с названием
                    Image(activity.imageName)
                        .resizable()
                        .frame( height: 200)
                    
                }.sheet(isPresented: $showingDetail1){
                        DetailView1()}
                }
                

                HStack {
                    Text(activity.title)
                        .font(.system(size: 28, weight: .semibold))
                   
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.01)]),
                        startPoint: .bottom,
                        endPoint: .top)
                )
            }
            
            VStack(alignment: .leading, spacing: 20) {
                // Сведения
                InfoItemView(title: "КРАТКО", description: activity.short)
                HStack {

                    Spacer()
                }
                
                
                if activity.needBooking {
                    
                    ActivityBookView(bookAct: activity.bookAct, bookBook: activity.bookBook)
                }
                
               
            }.padding()
            .background(Color.white)
            
        }.cornerRadius(15)
    }
}


struct ActivityBookView: View {
  let bookAct: String
   let bookBook: String
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading, spacing: 10) {
                
            }
                        
            Button(action: {}){
                
                Text("Подробнее")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .cornerRadius(5)
                
            }
        }
    }
}





