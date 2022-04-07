//
//  TopNavigationView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI

struct TopNavigationView: View {
    @ObservedObject var placeFinder: PlaceFinder
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation { placeFinder.selectedPlace = nil }
            }, label: {
                Image(systemName: "arrow.left")
                    .padding()
                    .foregroundColor(.black)

            })
            
            Spacer()
            
            Text(placeFinder.selectedPlace?.name ?? "")
                .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            
            
            Button(action: actionSheet){
            Image(systemName: "paperplane")
                .padding()
                .foregroundColor(.black)
        }
            
            
}
       
            }
    func actionSheet() {
            guard let data = URL(string: "https://clck.ru/ecKkj") else { return }
            let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        }
    }
    
