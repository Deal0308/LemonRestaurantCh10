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
    
    // Computed Properties
    var trimmedName: String {
        userName.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var trimmedPhone: String {
        phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var nameFieldColor: Color {
        if trimmedName.isEmpty {
            return .red
        } else if trimmedName.count < 3 {
            return .orange
        } else {
            return .green
        }
    }
    
    var isPhoneValid: Bool {
        trimmedPhone.count == 10
    }
    
    var isReservationValid: Bool {
        !trimmedName.isEmpty && trimmedName.count >= 3 && isPhoneValid
    }
    
    var reservationStatus: String {
        if trimmedName.isEmpty && trimmedPhone.isEmpty {
            return "Missing name and phone number."
        } else if trimmedName.isEmpty {
            return "Missing name."
        } else if trimmedName.count < 3 {
            return "Name is too short."
        } else if trimmedPhone.isEmpty {
            return "Missing phone number."
        } else if !isPhoneValid {
            return "Phone number must be 10 digits."
        } else {
            return "Reservation ready to preview."
        }
    }
    
    var statusColor: Color {
        isReservationValid ? .green : .red
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                // Header
                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "calendar.badge.plus")
                            .font(.system(size: 60))
                            .foregroundColor(.orange)
                        
                        Text(restaurantName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Reservation Form")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                }
                
                // Reservation Details
                Section(header: Label("Reservation Details", systemImage: "person.fill")) {
                    
                    TextField("Full Name", text: $userName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .padding(8)
                        .background(nameFieldColor.opacity(0.08))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(nameFieldColor, lineWidth: 1)
                        )
                    
                    if trimmedName.isEmpty {
                        Text("Please enter your name.")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else if trimmedName.count < 3 {
                        Text("Name is too short.")
                            .font(.caption)
                            .foregroundColor(.orange)
                    } else {
                        Text("Name looks good.")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    
                    Stepper("Guests: \(guestCount)",
                            value: $guestCount,
                            in: 1...maxGuests)
                    
                    if guestCount >= 8 {
                        Text("Large group — please call ahead if possible.")
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
                    
                    TextField("Occasion (Birthday, Anniversary, etc.)", text: $occasion)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                }
                
                // Contact Information
                Section(header: Label("Contact Information", systemImage: "phone.fill")) {
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    
                    if trimmedPhone.isEmpty {
                        Text("Please enter your phone number.")
                            .font(.caption)
                            .foregroundColor(.red)
                    } else if !isPhoneValid {
                        Text("Phone number must be 10 digits.")
                            .font(.caption)
                            .foregroundColor(.orange)
                    } else {
                        Text("Phone number looks good.")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                }
                
                // Specials
                Section(header: Label("Specials", systemImage: "tag.fill")) {
                    Toggle("Show special offer", isOn: $showMessage)
                    
                    if showMessage {
                        Text("Discount available for you!")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                }
                
                // Status
                Section(header: Label("Status", systemImage: "checkmark.seal.fill")) {
                    Text(reservationStatus)
                        .font(.headline)
                        .foregroundColor(statusColor)
                }
                
                // Actions
                Section(header: Label("Actions", systemImage: "square.and.pencil")) {
                    Button {
                        previewText = """
                        Name: \(trimmedName)
                        Guests: \(guestCount)
                        Children: \(childrenCount)
                        Phone Number: \(trimmedPhone)
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
                    .disabled(!isReservationValid)
                }
                
                // Preview
                Section(header: Label("Preview", systemImage: "doc.text.fill")) {
                    Text(previewText.isEmpty ? "No preview available." : previewText)
                        .font(.body)
                        .padding(.vertical, 6)
                        .multilineTextAlignment(.leading)
                        .textSelection(.enabled)
                }
            }
            .navigationTitle("Reservation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ReservationForm()
}
