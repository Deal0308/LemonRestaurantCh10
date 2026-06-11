//
//  AboutView.swift
//  LemonRestaurantCh10
//
//  Created by Michael Deal on 6/2/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "leaf.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.green)
                    
                    Text("About Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("Fresh Mediterranean Dining")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 30)
                
                // Description Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Our Story")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Little Lemon is a cozy Mediterranean restaurant focused on fresh ingredients, bold flavors, and a welcoming dining experience. Our menu features handcrafted dishes inspired by traditional Mediterranean cooking, including fresh salads, warm entrées, and flavorful desserts.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                    
                    Text("Whether you are visiting for a family meal, a quick lunch, or a special occasion, our goal is to provide quality food in a comfortable and inviting atmosphere.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(18)
                
                // Highlights
                HStack(spacing: 20) {
                    FeatureIcon(symbol: "fork.knife", title: "Fresh")
                    FeatureIcon(symbol: "leaf.fill", title: "Local")
                    FeatureIcon(symbol: "map.fill", title: "Cozy")
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(18)
                .shadow(radius: 3)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeatureIcon: View {
    let symbol: String
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: symbol)
                .font(.title)
                .foregroundColor(.green)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
