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
    
    @IBOutlet var nombre: UILabel!
    @IBOutlet var telefono: UILabel!
    @IBOutlet var web: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Lugar Hardcodeado
        lugar = Lugar(nombre: "El Regato", direccion: "El Regato Biscay, Spain", tipo: "Espacio Verde")
        lugar.telefono = "666555444"
        lugar.web = "http://surfsearchspot.com/"
        
        //pintar datos en pantalla
        nombre.text   = "Nombre: \(lugar.nombre!)"
        web.text      = "Web: \(lugar.web!)"
        telefono.text = "Telefono: \(lugar.telefono!)"
        
        //Buscar Luegar por su direccion
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(lugar.direccion) { (placemarks, error) in
            if error  == nil {
                
                //Puede encontrar mas de un lugar
                for placemark in placemarks! {
                    print(placemark)
                    
                    //crear Marker o Annotation
                    let annotation = MKPointAnnotation()
                    annotation.title = self.lugar.nombre
                    annotation.coordinate = placemark.location!.coordinate
                                        
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

