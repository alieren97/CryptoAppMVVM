//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Ali Eren on 9.02.2022.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(
            action:{
                presentationMode.wrappedValue.dismiss()
            },label:{
                Image(systemName:"xmark")
                    .font(.headline)
            })
    }
}


struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
