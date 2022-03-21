//
//  OrderView.swift
//  SwiftUIExamples
//
//  Created by Luis Eugenio Santos Gonzalez on 20/03/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) {item in
                        HStack {
                            ItemRow(item: item)
                        }
                    }
                }
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationTitle("Order")
            #if os(iOS)
            .listStyle(InsetGroupedListStyle())
            #else
            .listStyle(.inset)
            #endif
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
