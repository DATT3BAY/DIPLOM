//
//  InfoItemView.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 30.03.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI

struct InfoItemView: View {
    let title: String
    let description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray)
            Text(description)
                .font(.system(size: 16))
        }
    }
}
