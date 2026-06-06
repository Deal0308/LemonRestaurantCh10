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
    @State private var showMessage = false
    
    // Computed property
    var nameFieldColor: Color {
        if userName.isEmpty {
            return .red
        } else if userName.count < 3 {
            return .orange
        } else {
            return .green
        }
    }
    
    var reservationStatus: String {
        if userName.isEmpty && phoneNumber.isEmpty {
            return "Missing name and phone number."
        } else if userName.isEmpty {
            return "Missing name."
        } else if phoneNumber.isEmpty {
            return "Missing phone number."
        } else {
            return "Reservation successful!"
        }
    }
    var body: some View {
        Form {
            
            // Header
            Section {
                VStack(spacing: 8) {
                    Image(systemName: "fork.knife.circle.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 42))
                    
                    Text(restaurantName)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Reservation Form")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
            }
            
            // Reservation Details
            Section(header: Text("Reservation Details")) {
                TextField("Full Name", text: $userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                    .padding(8)
                    .background(nameFieldColor.opacity(0.05))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(nameFieldColor, lineWidth: 1.0)
                    )
                
                if userName.isEmpty {
                    Text("Please enter your name to continue.")
                        .font(.caption)
                        .foregroundColor(.red)
                } else if userName.count < 3 {
                    Text("Name is too short.")
                        .font(.caption)
                        .foregroundColor(.orange)
                } else {
                    Text("Looks good!")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                
                Stepper("Guests: \(guestCount)",
                        value: $guestCount,
                        in: 1...maxGuests)
                
                if guestCount > 8 {
                    Text("Large group - we'll do our best to accommodate you.")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
                
                Stepper("Children: \(childrenCount)",
                        value: $childrenCount,
                        in: 0...maxChildren)
                
                if childrenCount > 0 {
                    Text("Kids menu available.")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                
                Toggle("Show a special text", isOn: $showMessage)
                
                if showMessage {
                    Text("Discount available for you!")
                        .foregroundColor(.green)
                        .font(.caption)
                }
                
                TextField("Occasion (Birthday, Anniversary, etc.)", text: $occasion)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
            }
            
            // Contact Information
            Section(header: Text("Contact Information")) {
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                
                if phoneNumber.isEmpty {
                    Text("Please enter your phone number.")
                        .font(.caption)
                        .foregroundColor(.red)
                } else if phoneNumber.count != 10 {
                    Text("Please enter a valid 10-digit phone number.")
                        .font(.caption)
                        .foregroundColor(.orange)
                } else {
                    Text("Looks good!")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
            
            // Status
            Section(header: Text("Status")) {
                Text(reservationStatus)
                    .font(.caption)
                    .foregroundColor(userName.isEmpty || phoneNumber.isEmpty ? .red : .green)
            }
            
            // Actions
            Section(header: Text("Actions")) {
                Button {
                    previewText = """
                    Name: \(userName)
                    Guests: \(guestCount)
                    Children: \(childrenCount)
                    Phone Number: \(phoneNumber)
                    Occasion: \(occasion.isEmpty ? "None" : occasion)
                    """
                } label: {
                    HStack {
                        Spacer()
                        Text("Preview Reservation")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                .disabled(userName.isEmpty || phoneNumber.isEmpty)
                .padding(.top, 8)
                .padding(.horizontal, 16)
            }
            
            // Preview
            Section(header: Text("Preview")) {
                Text(previewText.isEmpty ? "No preview available." : previewText)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.vertical, 6)
                    .multilineTextAlignment(.leading)
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
