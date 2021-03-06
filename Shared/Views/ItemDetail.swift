//
//  ItemDetail.swift
//  SwiftUIExamples
//
//  Created by Luis Eugenio Santos Gonzalez on 20/03/22.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    
    @Environment(\.presentationMode) var presentationMode
    
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
                presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }.environmentObject(Order())
    }
}
