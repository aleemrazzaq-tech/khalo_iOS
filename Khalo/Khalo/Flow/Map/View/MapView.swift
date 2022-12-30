//
//  MapView.swift
//  Khalo
//
//  Created by Furqan on 28/12/2022.
//

import SwiftUI
import MapKit
import Combine

struct MapView: View {
    @ObservedObject private var locationManager = LocationManager()
    @State var value:String = ""
    @ObservedObject var Location :LocationViewModel
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $locationManager.region , showsUserLocation: true)
                .preferredColorScheme(.dark)
                .foregroundColor(.black)
                .ignoresSafeArea(.all)
            
            
            VStack
            {
            
            if let value = locationManager.placemark?.description
            {
                let _ = print("Data in \(value)")
                TextFieldDesign(value:value, text: "Location")
                   .background(.white)
            }else{
                TextFieldDesign(value:"", text: "Location")
                   
                   .background(.white)
            }
            } .position(x:UIScreen.main.bounds.width/2, y: 100)
            
            VStack
            {
            
                Button(action:{
                    if let value = locationManager.placemark?.description
                    {
                        Location.addLocation(value: value)
                    }
                })
                {
                    Text("Get data")
                }
          }.position(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height-150)
               
                
            }
                
           
             
        
            
           
        }
       
           
    }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(Location: LocationViewModel())
    }
}
