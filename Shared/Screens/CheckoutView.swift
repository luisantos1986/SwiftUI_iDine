//
//  CheckoutView.swift
//  iDine
//
//  Created by Luis Eugenio Santos Gonzalez on 20/03/22.
//

import SwiftUI

enum PaymentTypes: String, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case points = "iDine Points"
}

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var paymentType: PaymentTypes = .cash
    
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(PaymentTypes.allCases, id:\.self) {
                        Text($0.rawValue)
                    }
                }
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
