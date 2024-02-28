//
//  MapView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 28/02/24.
//

import UIKit
import SwiftUI
import MapKit

struct MapaView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Self.Context) -> UIViewType {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView(coordinate: viagens[0].localizacao)
    }
}
