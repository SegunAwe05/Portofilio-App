//
//  DeletedCard.swift
//  Portfolio
//
//  Created by Segun Awe on 1/7/22.
//

import SwiftUI

struct DeletedCard: View {
    var body: some View {
        VStack {
            Text("Your Item has been deleted")
                .foregroundColor(.primary)
        }.frame(width: 200, height: 100)
            .padding(5)
            .background(Color("AddColor"))
            .cornerRadius(10)
    }
}

struct DeletedCard_Previews: PreviewProvider {
    static var previews: some View {
        DeletedCard()
    }
}
