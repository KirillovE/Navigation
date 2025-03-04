//
//  AddView.swift
//  iExpense
//
//  Created by Paul Hudson on 16/10/2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var title = "Add new expense"

    var expenses: Expenses

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($title)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
              ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                  let item = ExpenseItem(name: title, type: type, amount: amount)
                  expenses.items.append(item)
                  dismiss()
                }
              }
              ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                  dismiss()
                }
              }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
