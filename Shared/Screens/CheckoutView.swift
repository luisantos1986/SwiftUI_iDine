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
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total/100*Double(tipAmount)
        return formatter.string(from: NSNumber(value: total+tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(PaymentTypes.allCases, id:\.self) {
                        Text($0.rawValue)
                    }
                }
                Toggle("Add iDine loyalty Card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine id", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add tip")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(createTips(x: 5), id:\.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: \(totalPrice)")) {
                Button("Confirm order") {
                    // place the order
                }
            }
        }
    }
    
    func createTips(x: Int) -> [Int] {
        return (0...x).map { return $0 * 5 }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
