//
//  SecondViewController.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 21/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//
import AVKit
import UIKit
import AVFoundation
import SwiftUI

class SwiftUIViewHostingController: UIHostingController<SecondViewController> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SecondViewController())
    }
}

struct SecondViewController: View {
    var body: some  View{
        
        NavigationView{
            ZStack {
                
                GeometryReader{
                    geo in
                    
                    Image ("фон2")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width,
                               height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment:.center){
                            HStack{
                                Text("Томск")
                                    .font(.system(.headline, design: .rounded))
                                    .foregroundColor(.white)
                                Text("Россия")
                                    .fontWeight(.ultraLight)
                                    .foregroundColor(.white)
                                
                            }
                            VStack(alignment: .leading, spacing: 8){
                                HStack{
                                    Text("Добро пожаловать!")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                Text("Открой для себя новые приключения")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                
                            }
                            
                        }.padding()
                        
                        HStack{
                            VStack{
                                Button(action: {}){
                                    Image(systemName: "triangle")
                                        .foregroundColor(.white)
                                        .padding(.all, 18)
                                        .background(Color.blue.opacity(0.8))
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                    
                                }
                                Text("Горы")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            
                            VStack{
                                Button(action: {}){
                                    Image(systemName: "circle.bottomthird.split")
                                        .foregroundColor(.white)
                                        .padding(.all, 18)
                                        .background(Color.orange.opacity(0.8))
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                    
                                }
                                Text("Озера")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            VStack{
                                
                                Button(action: {}){
                                    
                                    Image(systemName: "rectangle.grid.2x2.fill")
                                        .foregroundColor(.white)
                                        .padding(.all, 18)
                                        .background(Color.yellow.opacity(0.8))
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                    
                                    
                                    
                                }
                                Text("Другое")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                            
                            VStack{
                                
                                Button(action: {}){
                                    
                                    Image(systemName: "cloud")
                                        .foregroundColor(.white)
                                        .padding(.all, 18)
                                        .background(Color.purple.opacity(0.8))
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                    
                                    
                                }
                                Text("Погода")
                                    .font(.footnote)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }.padding()
                        
                        Spacer()
                        
                        
                        HStack{
                            Text("Выберите").font(.largeTitle).foregroundColor(.white)
                            Text("Категорию").font(.largeTitle).fontWeight(.heavy).foregroundColor(.white)
                        }.padding(.vertical)
                        
                        
                        //                        VStack(alignment:.center){
                        //                        HStack(spacing:60){
                        //                            Text("Путешествия для всех").foregroundColor(.white)
                        //
                        ////                            Text("Past").foregroundColor(.white)
                        //                           Text("Путешествия в дополненной реальности").foregroundColor(.white)
                        //                       }.padding(.vertical)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(spacing:20){
                                
                                NavigationLink(destination: travelMenu()){
                                    Image("TRIPS")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 350)
                                        .cornerRadius(30)
                                }.buttonStyle(PlainButtonStyle())
                                
                                
                                Image("VR")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 350)
                                    .cornerRadius(30)
                                
                            }
                        }.padding(.trailing, -20)
                    }.padding()
                    
                }
            }
        }
    }
}


