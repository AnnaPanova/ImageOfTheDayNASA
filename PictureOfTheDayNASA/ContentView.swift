//
//  ContentView.swift
//  PictureOfTheDayNASA
//
//  Created by Anna Panova on 26.06.24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
   @State private var selectedDate: String = "2016-10-01"
    @State private var apiClient = APIClient()
    @State private var image = ImageNASA()
    @State private var imageURL: String = ""
    
    private func getImageURL() {
        imageURL = "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg"
    }
    
    
    var body: some View {
        return VStack {
            dateView()
                .padding(20)
            Button("Show me the image"){
                getImageURL()
                print("image url: \(imageURL)")
                 print("I try")
            }
            .padding(20)
            .buttonBorderShape(.roundedRectangle(radius: 20.0))
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            
            ImageView()
              
            Text("There will be description")
                .padding(20)
            
                  
               
            Spacer()
        }
        .padding()
    }
}

struct ImageView: View {
    var body: some View {
        AsyncImage(url: URL(string:"https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg")) { image in
            image.resizable()
                .frame( maxWidth: .infinity, maxHeight: 350.0, alignment: .center)
        } placeholder: {
            Image(systemName: "sparkles")
                .resizable()
                .frame( maxWidth: .infinity, maxHeight: 350.0, alignment: .center)
        }
    }
}


// Defaults to today's date. Must be after 1995-06-16
struct dateView: View {
    var body: some View {
        DatePicker("please, choose a date", selection: .constant(.now), displayedComponents: [.date])
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
