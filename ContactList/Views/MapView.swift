//
//  MapView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

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
