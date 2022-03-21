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
                    NavigationLink(destination: Text("Check Out")) {
                        Text("Place Order")
                    }
                }
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
