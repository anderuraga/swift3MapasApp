//
//  ViewController.swift
//  Mapas
//
//  Created by Spot Matic SL on 17/10/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var lugar : Lugar!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lugar = Lugar(nombre: "El Regato", direccion: "El Regato Biscay, Spain", tipo: "Espacio Verde")
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(lugar.direccion) { (placemarks, error) in
            if error  == nil {
                for placemark in placemarks! {
                    print(placemark)
                    let annotation = MKPointAnnotation()
                    annotation.title = self.lugar.nombre
                    
                    //mostrar en mapa
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
             
            }else{
                print("Hemos tenido un error: \(error?.localizedDescription)")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

