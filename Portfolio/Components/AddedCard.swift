//
//  Added Card.swift
//  Portfolio
//
//  Created by Segun Awe on 1/7/22.
//

import SwiftUI

struct AddedCard: View {
    var body: some View {
        VStack {
            Text("Your Item has been added")
                .foregroundColor(.primary)
        }.frame(width: 200, height: 100)
            .padding(7)
            .background(Color("AddColor"))
            .cornerRadius(10)
    }
}

struct AddedCard_Previews: PreviewProvider {
    static var previews: some View {
        AddedCard()
    }
}
