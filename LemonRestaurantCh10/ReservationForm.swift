//
//  ReservationForm.swift
//  LemonRestaurantCh10
//
//  Created by Michael Deal on 6/4/26.
//

import SwiftUI

struct ReservationForm: View {
    
    // Constants
    let restaurantName = "Little Lemon"
    let maxGuests = 50
    let maxChildren = 25
    
    // Variables
    @State private var userName: String = ""
    @State private var guestCount: Int = 1
    @State private var childrenCount: Int = 0
    @State private var phoneNumber: String = ""
    @State private var occasion: String = ""
    @State private var previewText: String = ""
    
    var body: some View {
        Form {
            
            // Header
            Section {
                VStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .foregroundColor(.orange)
                        .font(.title2)
                    
                    Text(restaurantName)
                        .font(.title3)
                        .bold()
                    
                    Text("Reservation Form")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            
            // Reservation Details
            Section(header: Text("Reservation Details")) {
                TextField("Name", text: $userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                Stepper("Guests: \(guestCount)",
                        value: $guestCount,
                        in: 1...maxGuests)
                
                Stepper("Children: \(childrenCount)",
                        value: $childrenCount,
                        in: 0...maxChildren)
                
                TextField("Occasion (Birthday, Anniversary, etc.)", text: $occasion)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
            }
            
            // Contact Information
            Section(header: Text("Contact Information")) {
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
            }
            
            // Actions
            Section(header: Text("Actions")) {
                Button("Preview Reservation") {
                    previewText = """
                    Name: \(userName)
                    Guests: \(guestCount)
                    Children: \(childrenCount)
                    Phone Number: \(phoneNumber)
                    Occasion: \(occasion)
                    """
                }
            }
            
            // Preview
            Section(header: Text("Preview")) {
                Text(previewText.isEmpty ? "No preview available." : previewText)
                    .padding()
                    .cornerRadius(8)
                    .fixedSize()
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .lineLimit(nil)
                    .foregroundColor(Color(.label))
                    .textSelection(.enabled)
            }
        }
        .navigationTitle("Reservation")
    }
}

#Preview {
    NavigationStack {
        ReservationForm()
    }
}
