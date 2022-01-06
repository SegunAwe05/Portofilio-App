//
//  smallCard.swift
//  Portfolio
//
//  Created by Segun Awe on 1/3/22.
//

import SwiftUI

struct SmallCard: View {
    var subject: String
    var title: String
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 15.0)
            .frame(width: 140, height: 150)
            .foregroundColor(Color("CardBack"))
            VStack(alignment: .leading) {
                
                HStack {
                Spacer().frame(width: 105)
                    Button {
                        //
                    } label: {
                        Image(systemName: "x.circle.fill").opacity(0.6)
                        .foregroundColor(.red)
                        .padding(3)
                    }
                }
                    
                Text(subject)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 120, alignment: .leading)
                    .padding(5)
                Text(title)
                    .foregroundColor(.primary)
                    .frame(width: 120, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(5)
                Spacer().frame(height: 30)
            }
        }
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(subject: "Career", title: "Update Resume")
    }
}