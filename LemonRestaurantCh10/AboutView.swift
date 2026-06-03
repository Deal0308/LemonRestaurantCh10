//
//  AboutView.swift
//  LemonRestaurantCh10
//
//  Created by Michael Deal on 6/2/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
           
        Text("About Little Lemon")
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.green))
            
                .padding()
        Text("Little Lemon is a cozy Mediterranean Restaurant serving Mediterranean dishes in a warm, inviting atmosphere. We offer a wide variety of fresh, locally sourced ingredients, and our chefs are passionate about bringing the flavors of the Mediterranean to life in every dish. Whether you're in the mood for a hearty stew, a refreshing salad, or a delightful dessert, Little Lemon has something special for everyone.")
            .font(.caption)
            .padding()
            .background(Color(.systemGray6))
            HStack {
                Image(systemName: "fork.knife")
                    .foregroundColor(Color(.yellow))
                Image(systemName: "leaf")
                    .foregroundColor(Color(.green))
                
                Image(systemName: "map")
                
                    .foregroundColor(Color(.blue))
                    .imageScale(.small)
                
                

                    
                }
                
            }
            

        }
        
            
        }
            
    
        
    


#Preview {
    AboutView()
}
