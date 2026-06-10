///
//  BillCalculatorView.swift
//  LemonRestaurantCh10
//
//  Created by Michael Deal on 6/9/26.
//

import SwiftUI

struct BillCalculatorView: View {
    
    // Constants
    let restaurantName = "Lemon Restaurant"
    let adultPrice: Double = 15.00
    let childPrice: Double = 10.00
    let taxRate: Double = 0.08
    let discountRate: Double = 0.10
    
    // Variables
    @State private var adults = 1
    @State private var children = 0
    @State private var hasDiscount = false
    @State private var addTip = false
    @State private var tipPercentage = 20.0
    
    // Functions
    func calculateSubtotal() -> Double {
        let adultTotal = Double(adults) * adultPrice
        let childTotal = Double(children) * childPrice
        return adultTotal + childTotal
    }
    
    func discountAmount() -> Double {
        if hasDiscount {
            return calculateSubtotal() * discountRate
        } else {
            return 0.00
        }
    }
    
    func calculateTax() -> Double {
        let discountedSubtotal = calculateSubtotal() - discountAmount()
        return discountedSubtotal * taxRate
    }
    
    func finalTotal() -> Double {
        return calculateSubtotal() - discountAmount() + calculateTax()
    }
    
    func tipAmount() -> Double {
        if addTip {
            return finalTotal() * (tipPercentage / 100)
        } else {
            return 0.00
        }
    }
    
    func grandTotal() -> Double {
        return finalTotal() + tipAmount()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                // Header
                Section {
                    VStack(spacing: 10) {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 70))
                        
                        Text(restaurantName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Bill Calculator")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                
                // Input
                Section(header: Label("Your Group", systemImage: "person.3.fill")) {
                    Stepper("Adults: \(adults)", value: $adults, in: 1...20)
                    Stepper("Children: \(children)", value: $children, in: 0...20)
                    Toggle("Apply 10% Discount", isOn: $hasDiscount)
                }
                
                // Tip
                Section(header: Label("Tip", systemImage: "dollarsign.circle")) {
                    Toggle("Add Tip", isOn: $addTip)
                    
                    if addTip {
                        Text("Suggested Tip: 20%")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Text("Tip Percentage")
                            Spacer()
                            Text("\(Int(tipPercentage))%")
                                .foregroundColor(.green)
                        }
                        
                        Slider(value: $tipPercentage, in: 0...50, step: 1)
                    }
                }
                
                // Bill Summary
                Section(header: Label("Bill Summary", systemImage: "receipt")) {
                    
                    HStack {
                        Text("Adults")
                        Spacer()
                        Text("\(adults) × $\(String(format: "%.2f", adultPrice))")
                    }
                    
                    HStack {
                        Text("Children")
                        Spacer()
                        Text("\(children) × $\(String(format: "%.2f", childPrice))")
                    }
                    
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("$\(String(format: "%.2f", calculateSubtotal()))")
                    }
                    
                    if hasDiscount {
                        HStack {
                            Text("Discount")
                            Spacer()
                            Text("-$\(String(format: "%.2f", discountAmount()))")
                                .foregroundColor(.green)
                        }
                    }
                    
                    HStack {
                        Text("Tax")
                        Spacer()
                        Text("$\(String(format: "%.2f", calculateTax()))")
                            .foregroundColor(.red)
                    }
                    
                    HStack {
                        Text("Total")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("$\(String(format: "%.2f", finalTotal()))")
                            .fontWeight(.semibold)
                    }
                    
                    if addTip {
                        HStack {
                            Text("Tip")
                            Spacer()
                            Text("$\(String(format: "%.2f", tipAmount()))")
                                .foregroundColor(.green)
                        }
                        
                        HStack {
                            Text("Total with Tip")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("$\(String(format: "%.2f", grandTotal()))")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Bill Calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BillCalculatorView()
}
