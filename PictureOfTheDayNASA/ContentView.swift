//
//  ContentView.swift
//  PictureOfTheDayNASA
//
//  Created by Anna Panova on 26.06.24.
//

import Foundation
import SwiftUI

    
struct ContentView: View {
      @State private var date = Date.now
      @State private var image : ImageNASA?
      @State private var apiClient = APIClient()
      @State private var imageURL: String = ""
    
    func fetchImage() async {
        do {
            image = try await apiClient.getImageFomResponse(date: date) ?? nil
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        return VStack {
            
            // Date picker that allows to choose a date
            DateView(date: $date)
                .padding(20)
            
            // Button that initiate an API request
            Button("Show me the image") {
                Task{
                    do {
                      try await fetchImage()
                        print("Button was pressed, image url: \(image?.url ?? "No url") ")
                    } catch {
                        print(error)
                    }
                }
            }
            .padding(20)
            .buttonBorderShape(.roundedRectangle(radius: 20.0))
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            
            // Image displays photo for selected date
            ImageView(url: image?.url ?? imageURL)
            
            // Title of photo
            Text("\(image?.title ?? "")")
                .padding(20)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
