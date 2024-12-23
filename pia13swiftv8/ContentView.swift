//
//  ContentView.swift
//  pia13swiftv8
//
//  Created by BillU on 2024-12-23.
//

import SwiftUI
import CoreLocationUI
import CoreLocation
import MapKit

// 55.611218005894216, 12.99424837517205

/*
 
 
 Map(coordinateRegion: $region, showsUserLocation: true)
             .frame(width: 400, height: 300)
 
 */

struct ContentView: View {
    
    @State var fancypos = FancyPosition()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:55.611218005894216, longitude: 12.99424837517205), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))

    let mincCoffee = CLLocationCoordinate2D(latitude: 55.611218005894216, longitude: 12.99424837517205)
    let mincCoffee2 = CLLocationCoordinate2D(latitude: 55.611218005894216, longitude: 12.99421837517205)

    
    @State private var selectedMarker: MKMapItem?
        
    var body: some View {
        VStack {

            Map(bounds: MapCameraBounds(centerCoordinateBounds: getMinc())) {
                Marker("Minc Kaffe", coordinate: mincCoffee)
                
                Annotation("Minc kaffe", coordinate: mincCoffee2) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.yellow)
                                            .frame(width: 100, height: 50)
                                        Text("🛝")
                                            .padding(5)
                                    }
                                    .onTapGesture {
                                        print("KLICK PÅ RUTA")
                                    }
                                }
            
                
            }
            .frame(width: 400, height: 300)
            .mapStyle(.standard)
            .mapControlVisibility(.hidden)
            .mapItemDetailSheet(item: $selectedMarker)
            
            if let selectedMarker = selectedMarker {
                Text(selectedMarker.name ?? "Unknown")
            }
            
            LocationButton {
                fancypos.fancyGetPosition()
            }
            
            if let userLocation = fancypos.userLocation {
                Text("\(userLocation.coordinate.latitude)")
                Text("\(userLocation.coordinate.longitude)")
            } else {
                Text("User's location not found")
            }
            
            Button("Get Auth") {
                fancypos.fancyGetAuth()
            }
            
            Button("Get Position") {
                fancypos.fancyGetPosition()
            }
        }
        .padding()
    }
    
    func getMinc() -> MKMapRect{
        
        let minc = CLLocationCoordinate2D(latitude: 55.611218005894216, longitude: 12.99424837517205)
        
        
        let mincRect = MKMapRect(
            origin: MKMapPoint(minc),
            size: MKMapSize(width: 1, height: 1)
        )
        
        return mincRect
    }
    
}

#Preview {
    ContentView()
}
