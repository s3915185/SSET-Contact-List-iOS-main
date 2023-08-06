/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Tran Hoang Vu
  ID: S3915185
  Created  date: 31/7/2023
  Last modified: 8/8/2023
  Acknowledgement:
      1. Your code on GITHUB
      2. WIKIPEDIA FOR INFORMATION OF EACH BRANDS AND CARS
*/

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
   
    @State private var region = MKCoordinateRegion()
    @State var markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: -25.342863, longitude: 131.036974), tint: .blue))]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: markers) { marker in
            marker.location }
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
         region = MKCoordinateRegion(
             center: coordinate,
             span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
         )
         markers = [Marker(location: MapMarker(coordinate: coordinate, tint: .red))]
     }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: -25.342863, longitude: 131.036974))
    }
}
