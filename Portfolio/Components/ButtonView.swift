//
//  ButtonView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/1/22.
//

import SwiftUI

struct ButtonView: View {
var body: some View {
        Image(systemName: "plus")
            .foregroundColor(Color.green)
            .padding(7)
            .background(Color("ButtonBackground"))
            .cornerRadius(9)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
